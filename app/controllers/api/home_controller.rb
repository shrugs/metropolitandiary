class Api::HomeController < ApplicationController
  def index
    render json: {working: 'yes'}
  end
end
