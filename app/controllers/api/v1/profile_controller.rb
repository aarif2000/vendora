class Api::V1::ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: {
      message: "You are authenticated",
      user: current_user
    }
  end
end