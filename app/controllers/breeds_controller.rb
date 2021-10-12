class BreedsController < ApplicationController
  def index
    @breeds = Breed.includes(:category).all
  end

  def show
    @breed = Breed.find_by(params[:id])
  end
end
