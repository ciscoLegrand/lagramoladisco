class CreateWebConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :web_configs do |t|
      t.string  :enterprise_name
      t.string  :url_web
      t.string  :cif
      t.string  :corporative_color
      t.string  :global_email
      t.string  :contact_phone
      t.string  :adress_line_one
      t.string  :adress_line_two
      t.string  :location
      t.string  :postal_code
      t.string  :region
      t.string  :country
      t.string  :url_facebook
      t.string  :url_instagram
      t.string  :url_twitter
      t.string  :url_pinterest
      t.string  :url_bodas_net
      t.string  :url_scrapper_bodas_net
      t.string  :language
      t.text    :meta_title
      t.text    :meta_description
      t.string  :ftp_user
      t.string  :ftp_password
      t.string  :secret_key_recaptcha
      t.string  :public_key_recaptcha

      t.timestamps
    end
  end
end
