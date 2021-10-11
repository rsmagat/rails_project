class AddCategoryToBreeds < ActiveRecord::Migration[6.1]
  def change
    add_reference :breeds, :category, null: false, foreign_key: true
  end
end
