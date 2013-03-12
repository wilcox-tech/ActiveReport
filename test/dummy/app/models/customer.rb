class Customer < ActiveRecord::Base
  has_many :orders
  attr_accessible :country, :name
end
