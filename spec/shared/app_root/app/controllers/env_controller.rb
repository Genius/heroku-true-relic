class EnvController < ApplicationController
  def show
    render :text => env.fetch(params[:var])
  end
end
