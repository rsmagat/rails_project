class BreedsController < ApplicationController
  def index
    @breeds = Breed.includes(:category).page params[:page]
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
