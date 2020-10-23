class Api::V1::Athlete::SchoolsController < Api::V1::Athlete::ApiController
  before_action :authenticate

  def create
    @school = School.new(school_params)
    if @school.save
      current_athlete.update(school: @school)
      render json: Athlete::SchoolSerializer.new(@school).serialized_json, status: :created
    else
      unprocessable_entity @school.errors
    end
  end

  def index
    @school = current_athlete.school
    render json: Athlete::SchoolSerializer.new(@school).serialized_json, status: :ok
  end

  private
    def school_params
      params.require(:school).permit(:school_name)
    end
end