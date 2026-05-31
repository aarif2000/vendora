class Api::V1::ProfileController < Api::V1::BaseController
  before_action :authenticate_user!

  def show
    authorize current_user
    render json: {
      message: "You are authenticated",
      user: current_user
    }
  end
end