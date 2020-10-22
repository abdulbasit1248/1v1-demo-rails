class Athlete::ProvidedServiceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
            :name,
            :service_name,
            :discription,
            :price,
            :duration,
            :status,
            :image_url,
            :location,
            :address,
            :updated_at
end
