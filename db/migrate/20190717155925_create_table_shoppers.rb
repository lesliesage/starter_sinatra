class CreateTableShoppers < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppers do |c|
      c.string :name
    end
  end
end
