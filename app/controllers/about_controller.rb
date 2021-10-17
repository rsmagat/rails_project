class AboutController < ApplicationController
    def search
        wildcard_search = "%#{params[:keywords]}%"
        @breeds = Breed.where("breed_name LIKE ?", wildcard_search)
    end
end
