class Category < ApplicationRecord
    has_many :breeds, dependent: :destroy

    validates :name, presence:true
end
