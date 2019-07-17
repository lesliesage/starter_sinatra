class Item < ActiveRecord::Base
  has_many :orders
  has_many :shoppers, through: :orders  
end
