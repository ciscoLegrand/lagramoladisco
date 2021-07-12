class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.date :date_event
      t.string :password
      t.integer :order
      t.integer :position
      t.integer :wedding_guest
      t.integer :visitors
      
      t.timestamps
    end
  end
end
