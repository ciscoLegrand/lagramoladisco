class AddPositionToServiceItem < ActiveRecord::Migration[6.1]
  def change
    add_column :service_items, :position, :integer
    ServiceItem.order(:updated_at).each.with_index(1) do |service_item, index|
      service_item.update_column :position, index
    end
  end
end
