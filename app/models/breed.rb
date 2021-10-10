class Breed < ApplicationRecord
    belongs_to :category

    validates :breed_name, :image_url, presence: true
end
