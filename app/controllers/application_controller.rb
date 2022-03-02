class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordNotFound, with: :not_found


  private
  def not_found
    render json: { error: 'Your request could not be processed...' }, status: 422
  end
end
