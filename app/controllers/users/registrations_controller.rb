# app/controllers/users/registrations_controller.rb

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def sign_up(resource_name, resource)
    # Do nothing
  end
end