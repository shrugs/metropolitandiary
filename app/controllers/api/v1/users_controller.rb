class Api::V1::UsersController < ApplicationController
  before_action :require_authentication, only: [:show, :update, :destroy]

  # GET /api/v1/users
  def index
    userHash = ActiveModel::SerializableResource.new(@current_user, {}).as_json
    userHash[:entries] = @current_user.entries.map { |entry|
      result = ActiveRecord::Base.connection.execute("SELECT created_at from entries_users WHERE (user_id=#{@current_user.id}) AND (entry_id=#{entry.id})")
      created_at = result.first['created_at']

      entryHash = ActiveModel::SerializableResource.new(entry, {}).as_json
      entryHash[:created_at] = Time.zone.parse created_at
      entryHash
    }
    render json: userHash
  end

  # POST /api/v1/users
  def create
    # ios app is signing up
    # could, however, have deleted the app and re-downloaded, so it _should_ resync
    # if the device_token is provided, use that for identifying them
    if params.has_key? :device_token

      # if it already exists, this is our  user, else create one
      device = Device.find_by_device_token(params[:device_token])
      if device
        user = device.user
        user.generate_token
      else
        user = User.create
        user.devices.create({device_token: params[:device_token]})
      end
    end

    user ||= User.create(user_params)

    render json: {
      id: user.id,
      token: user.tokens.last.contents,
    }, status: :created
  end

  # # PATCH/PUT /api/v1/users/1
  # def update
  #   if @user.update(user_params)
  #     render json: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /api/v1/users/1
  def destroy
    @current_user.destroy
  end

  private

  def user_params
    params.permit(:timezone)
  end

end
