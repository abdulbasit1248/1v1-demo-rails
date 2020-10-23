class Api::V1::Athlete::ProvidedServicesController < Api::V1::Athlete::ApiController
  before_action :authenticate
  before_action :set_provided_service, only: [:update, :show, :destroy]

  def create
    provided_service = current_athlete.provided_services.new(provided_service_params)

    if provided_service.save
      render json: Athlete::ProvidedServiceSerializer.new(provided_service).serialized_json, status: :created
    else
      unprocessable_entity @provided_service.errors
    end
  end

  def update
    if(@provided_service.update(provided_service_params))
      render json: Athlete::ProvidedServiceSerializer.new(@provided_service).serialized_json, status: :created
    else
      unprocessable_entity @provided_service.errors
    end
  end

  def show
    render json: Athlete::ProvidedServiceSerializer.new(@provided_service).serialized_json, status: :ok
  end

  def index
    pagy, @services = pagy(current_athlete.provided_services, items: params[:per_page], page: params[:page])
    render json: Athlete::ProvidedServiceSerializer.new(@services).serializable_hash.merge(pagy: pagy), status: :ok
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

 def set_provided_service
  @provided_service = current_athlete.provided_services.find_by(id: params[:id])
 end

end