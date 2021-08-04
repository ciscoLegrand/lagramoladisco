class CreateServiceObjects < ActiveRecord::Migration[6.1]
  def change
    create_table :service_objects do |t|
      t.string :name
      t.float :price
      t.integer :position
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
