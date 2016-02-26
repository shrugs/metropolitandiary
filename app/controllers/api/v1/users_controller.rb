class Api::V1::UsersController < ApplicationController
  before_action :require_authentication, only: [:show, :update, :destroy]

  # GET /api/v1/users/1
  def show
    render json: @current_user
  end

  # POST /api/v1/users
  def create
    user = User.create
    if params.has_key? :device_token
      user.devices.create({device_token: params[:device_token]})
    end

    render json: user.tokens.last, status: :created
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
    params.permit(:device_token)
  end

end
