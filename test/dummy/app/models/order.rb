class Order < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :payment_type, :total_price
end
