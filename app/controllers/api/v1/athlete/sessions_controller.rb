class Api::V1::Athlete::SessionsController < Api::V1::Athlete::ApiController

  def create
    @athlete = Athlete.authenticate(params[:email], params[:password])
    return render json: { errors: ['Invalid email or password'] }, status: :unauthorized unless @athlete.present?
    render json: Athlete::AthleteSerializer.new(@athlete).serialized_json, status: :created
  end

end
