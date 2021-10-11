class AddBreedTypeToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :breed_type, :string
  end
end
