class AddBreedSoundToBreeds < ActiveRecord::Migration[6.1]
  def change
    add_column :breeds, :breed_sound, :string
  end
end
