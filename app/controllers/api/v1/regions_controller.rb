class Api::V1::RegionsController < ApplicationController
  before_action :require_authentication

  def index
    # return regions for all of the entries not in the user's diary
    other_entries = Entry.where('id NOT IN (?)', @current_user.entries.map(&:id))
    other_entries_hash = other_entries.map { |e|
      e.slice(:id, :lat, :lng, :radius)
    }.select { |e|
      e.values.all?(&:present?)
    }
    render json: other_entries_hash
  end

end
