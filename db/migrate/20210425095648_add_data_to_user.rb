class AddDataToUser < ActiveRecord::Migration[6.1]
  # type of data :string, :text, :integer, :float, :decimal, :datetime, :timestamp, :time, :date, :binary, :boolean
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :integer
    add_column :users, :birthdate, :date
    add_column :users, :address, :string
    add_column :users, :cod_postal, :integer
    add_column :users, :province, :string
    add_column :users, :dni, :string
    add_column :users, :language, :string
    add_column :users, :permission_level, :integer, default:0
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :role, :string, default: "user"
  end
end
