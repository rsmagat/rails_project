class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  def search
    @categories = Category.all
    
    wildcard_search = "%#{params[:keywords]}%"
    categories = "#{params[:categories]}"

    if "#{params[:categories]}" == ""
        @breeds = Breed.where("breed_name LIKE ?", wildcard_search)
    else
        @breeds = Breed.where("breed_name LIKE ? AND category_id = ?", wildcard_search, categories)
    end
  end
end
