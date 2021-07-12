class CreateAbouts < ActiveRecord::Migration[6.1]
  def change
    create_table :abouts do |t|
      t.string :name
      t.string :title
      t.boolean :visible
      t.integer :position
      
      t.timestamps
    end
  end
end
