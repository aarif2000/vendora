class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)

    sign_in(resource_name, resource)

    token = request.env['warden-jwt_auth.token']

    render json: {
      user: resource,
      token: token
    }, status: :ok
  end

  def respond_with(resource, _opts = {})
    render json: {
      id: resource.id,
      email: resource.email
    }, status: :ok
  end

  def respond_to_on_destroy
    head :no_content
  end
end