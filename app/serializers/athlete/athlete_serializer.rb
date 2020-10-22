class Athlete::AthleteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
            :email,
            :first_name,
            :last_name,
            :contact_number,
            :street,
            :city,
            :postal_code,
            :social_security_number,
            :license_number,
            :base_time,
            :base_price,
            :profile_description,
            :profile_title,
            :dob,
            :state,
            :address,
            :auth_token,
            :gender,
            :profile_image
end
