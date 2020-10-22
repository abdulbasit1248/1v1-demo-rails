class Api::V1::Athlete::ProvidedServicesController < Api::V1::Athlete::ApiController
  before_action :authenticate

  def create
    provided_service = current_athlete.provided_services.new(provided_service_params)

    if provided_service.save
      render json: Athlete::ProvidedServiceSerializer.new(provided_service).serialized_json, status: :created
    else
      unprocessable_entity @provided_service.errors
    end
  end

private
 def provided_service_params
      params.require(:provided_service).permit(
        :service_id,
        :name,
        :description,
        :price,
        :duration,
        :location,
        :address,
      )
    end
end