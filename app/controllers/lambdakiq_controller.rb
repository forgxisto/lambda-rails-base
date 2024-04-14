class LambdakiqController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST /lambdakiq
  def call
    params.permit!
    Lambdakiq.cmd(event: params[:event], context: {})
    head :ok
  end
end