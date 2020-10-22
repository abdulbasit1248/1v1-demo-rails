class Api::V1::Athlete::ProfilesController < Api::V1::Athlete::ApiController
  before_action :authenticate, only: [:show]

  def create
    @athlete = Athlete.new(athlete_params)
    if @athlete.save
      render json: Athlete::AthleteSerializer.new(@athlete).serialized_json, status: :created
    else
      render json: @athlete.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: User::UserSerializer.new(current_user).serialized_json, status: :ok
  end

 def update
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