class Api::V1::EntriesController < ApplicationController
  before_action :set_api_v1_entry, only: [:show, :update, :destroy]

  # GET /api/v1/entries
  def index
    @api_v1_entries = Api::V1::Entry.all

    render json: @api_v1_entries
  end

  # GET /api/v1/entries/1
  def show
    render json: @api_v1_entry
  end

  # POST /api/v1/entries
  def create
    @api_v1_entry = Api::V1::Entry.new(api_v1_entry_params)

    if @api_v1_entry.save
      render json: @api_v1_entry, status: :created, location: @api_v1_entry
    else
      render json: @api_v1_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/entries/1
  def update
    if @api_v1_entry.update(api_v1_entry_params)
      render json: @api_v1_entry
    else
      render json: @api_v1_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/entries/1
  def destroy
    @api_v1_entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_entry
      @api_v1_entry = Api::V1::Entry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_entry_params
      params.require(:api_v1_entry).permit(:id, :title, :content, :author, :permalink, :date_published)
    end
end
