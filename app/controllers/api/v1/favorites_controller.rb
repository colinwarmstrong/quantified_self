class Api::V1::FavoritesController < ApplicationController
  def index
    render json: Food.favorites
  end
end
