class ApplicationController < ActionController::API

    before_action :authorize_request
  
    attr_reader :current_user
  
    private
  
    def authorize_request
      header = request.headers['Authorization']
  
      if header.present?
        token = header.split(' ').last
        decoded = JsonWebToken.decode(token)
  
        return render json: { error: 'Invalid token' }, status: :unauthorized unless decoded
  
        @current_user = User.find(decoded['user_id'])
      else
        render json: { error: 'Token missing' }, status: :unauthorized
      end
  
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :unauthorized
    end
  end