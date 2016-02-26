class Api::V1::EntriesController < ApplicationController
  before_action :require_authentication
  before_action :set_entry, only: [:show]

  # GET /api/v1/entries
  def index
    render json: @current_user.entries
  end

  # GET /api/v1/entries/1
  def show
    render json: @entry
  end

  private
  def set_entry
    @entry = @current_user.entries.find_by_id(params[:id])
  end
end
