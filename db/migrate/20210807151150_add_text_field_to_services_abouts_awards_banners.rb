class AddTextFieldToServicesAboutsAwardsBanners < ActiveRecord::Migration[6.1]
  def change
    add_column :abouts, :body, :text
    add_column :abouts, :content_left, :text
    add_column :abouts, :content_right, :text
    add_column :awards, :body, :text
    add_column :home_banners, :quote, :text
    add_column :services, :description, :text
    add_column :service_objects, :description, :text
  end
end
