class BreedsController < ApplicationController
  def index
    @breeds = Breed.includes(:category).page params[:page]
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @breed = Breed.find(params[:id])
  end

  def search
    @categories = Category.all
    
    wildcard_search = "%#{params[:keywords]}%"
    categories = "#{params[:categories]}"

    if categories == ""
        @breeds = Breed.where("breed_name LIKE ?", wildcard_search)
    else
        @breeds = Breed.where("breed_name LIKE ? AND category_id = ?", wildcard_search, categories)
    end
  end
end
