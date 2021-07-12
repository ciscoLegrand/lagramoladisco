class CreateOpinions < ActiveRecord::Migration[6.1]
  def change
    create_table :opinions do |t|
      t.string :title
      t.text :body
      t.float :ratingStar
      t.string :name
      t.string :wedding_date

      t.timestamps
    end
  end
end
