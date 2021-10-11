class AddTypeToBreeds < ActiveRecord::Migration[6.1]
  def change
    add_column :breeds, :type, :string
  end
end
