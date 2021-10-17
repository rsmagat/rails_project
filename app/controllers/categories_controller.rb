class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    
    @breeds = Breed.where("breed_name LIKE ?", wildcard_search)
  end
end
