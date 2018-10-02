class Api::V1::FoodsController < ApplicationController
  def index
    foods = Food.all
    render json: foods
  end
end
