class Breed < ApplicationRecord
    belongs_to :category

    validates :breed_name, :image_url, presence: true
    validates :breed_name, length: { maximum: 100 }
end
