class AddBreedCoatLengthToBreeds < ActiveRecord::Migration[6.1]
  def change
    add_column :breeds, :breed_coat_length, :string
  end
end
