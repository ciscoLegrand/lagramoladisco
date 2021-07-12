class CreateHomeBanners < ActiveRecord::Migration[6.1]
  def change
    create_table :home_banners do |t|
      t.boolean   :parallax
      t.string    :title
      t.boolean   :visible
      t.integer   :position
      t.integer   :order

      t.timestamps
    end
  end
end
