class Api::V1::FavoritesController < ApplicationController
  def index
    render json: FavoritesPresenter.new.favorites
  end
end
