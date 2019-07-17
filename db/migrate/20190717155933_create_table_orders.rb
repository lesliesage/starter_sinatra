class CreateTableOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |c|
      c.integer :shopper_id
      c.integer :item_id
      c.integer :quantity
    end
  end
end
