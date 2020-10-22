class Athlete::ProvidedServiceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
            :name,
            :description,
            :price,
            :duration,
            :location,
            :address,
            :updated_at
end
