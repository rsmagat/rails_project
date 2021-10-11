class BreedsController < ApplicationController
  def index
    @breeds = Breed.includes(:category).all
  end

  def show
  end
end
