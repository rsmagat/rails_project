class Breed < ApplicationRecord
    belongs_to :category

    validates :breed_name, :image_url, :breed_type, presence: true
    validates :breed_name, length: { maximum: 100 }

    paginates_per 16
end
