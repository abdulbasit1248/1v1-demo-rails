class Api::V1::Athlete::EntriesController < Api::V1::Athlete::ApiController
  before_action :authenticate

  def create
    calendar_entry = current_athlete.entries.new(entries_params)
    if(calendar_entry.save)
      render json: Athlete::EntrySerializer.new(calendar_entry).serialized_json, status: :created
    else
      unprocessable_entity calendar_entry.errors
    end
  end

  def index
    # calendar_entries = current_athlete.entries.all
    calendar_entries = current_athlete.entries.between(params[:month].to_datetime).order('booking_date ASC') if params[:month].present?
    render json: Athlete::EntrySerializer.new(calendar_entries).serialized_json, status: :created
  end

  private
    def entries_params
      params.require(:entry).permit(:booking_date, :from_time, :to_time, :from_date, :to_date)
    end
end