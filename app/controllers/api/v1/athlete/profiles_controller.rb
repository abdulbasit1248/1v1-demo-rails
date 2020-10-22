class Api::V1::Athlete::ProfilesController < Api::V1::Athlete::ApiController
  before_action :authenticate, only: [:show, :update]

  def create
    @athlete = Athlete.new(athlete_params)
    if @athlete.save
      render json: Athlete::AthleteSerializer.new(@athlete).serialized_json, status: :created
    else
      render json: @athlete.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: Athlete::AthleteSerializer.new(current_athlete).serialized_json, status: :ok
  end

  def update
    if current_athlete.update(athlete_params)
      render json: Athlete::AthleteSerializer.new(current_athlete).serialized_json, status: :created
    else
      render json: current_athlete.errors, status: :unprocessable_entity
    end
  end

  private
  def athlete_params
    params.require(:athlete).permit(
      :email,
      :first_name,
      :last_name,
      :city,
      :contact_number,
      :postal_code,
      :street,
      :social_security_number,
      :license_number,
      :password,
      :password_confirmation,
      :dob,
      :address,
      :gender,
      :base_price,
      :profile_title,
      :profile_image,
      :state,
      provided_services_attributes: [:service_id, :price, :discription, :duration, :name, :location, :address], 
    )
  end
end