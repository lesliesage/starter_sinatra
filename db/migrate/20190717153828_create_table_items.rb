class CreateTableItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |c|
      c.string :name
      c.float :price
    end
  end
end
