class AddBreedSizeToBreeds < ActiveRecord::Migration[6.1]
  def change
    add_column :breeds, :breed_size, :string
  end
end
