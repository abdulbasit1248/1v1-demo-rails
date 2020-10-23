class Athlete::EntrySerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
            :booking_date,
            :from_time,
            :to_time,
            :from_date,
            :to_date
end
