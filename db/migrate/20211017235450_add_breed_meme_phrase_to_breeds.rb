class AddBreedMemePhraseToBreeds < ActiveRecord::Migration[6.1]
  def change
    add_column :breeds, :breed_meme_phrase, :string
  end
end
