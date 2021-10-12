class Category < ApplicationRecord
    has_many :breeds, dependent: :destroy

    validates :category_name, :breed_type, presence: true
    validates :category_name, length: { maximum: 100 }
end
