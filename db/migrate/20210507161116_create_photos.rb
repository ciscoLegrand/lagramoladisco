class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      # t.belongs_to :album, null: false, foreign_key: {to_table: :photos}
      t.timestamps
    end
  end
end
