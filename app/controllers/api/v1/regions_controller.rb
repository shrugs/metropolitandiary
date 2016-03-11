class Api::V1::RegionsController < ApplicationController
  before_action :require_authentication

  def index
    # return regions for all of the entries not in the user's diary
    other_entries = @current_user.other_entries
    other_entries_hash = other_entries.map { |e|
      e.slice(:id, :lat, :lng, :radius)
    }.select { |e|
      e.values.all?(&:present?)
    }
    render json: other_entries_hash
  end

  # called when a user enters a region
  def create
    # I want a user to get a notification in respnose to this action if:
    # 1) they have not gotten a notification today
    # 2) they have gotten a notification today, _but_, it was from a separate region trigger

    # I don't want a user to get this notification if:
    # 1) They've already received 2 notifications today
    # 2) They've received an automatically generated entry today

    # AKA, a user can receive either 1 auto entry or up to 2 region entries
    logs = @current_user.todays_entry_logs
    if !Rails.env.production? || logs.length == 0 || logs.length < 2 && logs.first.is_region?
      entry = Entry.find_by_id(region_params[:identifier].to_i)
      @current_user.add_entry_to_diary(entry)
    end
  end

  private

  def region_params
    params.permit(:identifier)
  end

end