class Category < ApplicationRecord
    has_many :breeds, dependent: :destroy

    validates :category_name, presence:true
end
