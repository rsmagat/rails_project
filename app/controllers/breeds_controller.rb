class BreedsController < ApplicationController
  def index
    @breeds = Breed.includes(:category).page params[:page]
  end

  def show
    @breed = Breed.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    
    @breeds = Breed.where("breed_name LIKE ?", wildcard_search)
  end
end
