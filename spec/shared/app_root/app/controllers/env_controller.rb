class EnvController < ApplicationController
  def show
    render :text => request.env.fetch(params[:var])
  end
end
