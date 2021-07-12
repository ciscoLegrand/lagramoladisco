class AddTittleToContentToAbouts < ActiveRecord::Migration[6.1]
  def change
    add_column :abouts, :title2, :string
    add_column :abouts, :title3, :string
  end
end
