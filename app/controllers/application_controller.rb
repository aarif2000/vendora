class ApplicationController < ActionController::API
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError do
        render json: { error: "Forbidden" }, status: :forbidden
    end
end
