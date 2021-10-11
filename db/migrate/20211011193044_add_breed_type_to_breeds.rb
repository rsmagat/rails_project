class AddBreedTypeToBreeds < ActiveRecord::Migration[6.1]
  def change
    add_column :breeds, :breed_type, :string
  end
end
