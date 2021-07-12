class CreateServiceItems < ActiveRecord::Migration[6.1]
  def change
    create_table :service_items do |t|
      t.string :name
      t.float :price
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
