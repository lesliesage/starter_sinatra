class Order < ActiveRecord::Base
  belongs_to :item
  belongs_to :shopper
end
