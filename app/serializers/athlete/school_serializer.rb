class Athlete::SchoolSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :school_name

  attribute :athletes do |school|
    Athlete::AthleteSerializer.new(school.athletes)
  end
end
