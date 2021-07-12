class AddTitleToAwards < ActiveRecord::Migration[6.1]
  def change
    add_column :awards, :title, :string
  end
end
