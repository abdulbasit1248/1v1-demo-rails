class Api::V1::Athlete::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error
  # include Pagy::Backend

  def current_athlete
    @current_athlete
  end

  def set_current_athlete(athlete)
    @current_athlete = athlete
  end

  protected
    def authenticate
      authenticate_token || not_authenticated
    end

    def unprocessable_entity(errors)
      render json: { errors: errors }, status: :unprocessable_entity
      return
    end

    def not_authenticated
      render json: { errors: ['Athlete not authorized'] }, status: :unauthorized
      return
    end

    def authenticate_token
      return false unless athlete_id_in_token?
      @current_athlete = Athlete.find_by(id: auth_token[:athlete_id])
      return false unless @current_athlete.present?
      set_current_athlete @current_athlete
      true
    end

  private
    def record_not_found_error
      render json: { errors: ['Object was not found'] }, status: :not_found
    end

    def http_token
      @http_token = request.headers['AUTH-TOKEN']
    end

    def auth_token
      @auth_token = JsonWebToken.decode(http_token)
    end

    def athlete_id_in_token?
      http_token && auth_token && !auth_token.is_a?(String) && auth_token[:athlete_id].to_i
    end
end
