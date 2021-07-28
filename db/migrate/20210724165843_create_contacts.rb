class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :restaurant_name
      t.integer :phone
      t.string :email, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.text :service_name
      t.text :additional_services
      t.text :observations_info, null: false
      t.date :date_event
      
      t.timestamps
    end
  end
end
