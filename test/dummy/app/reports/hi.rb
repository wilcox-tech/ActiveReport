class Hi < ActiveReport::Base
  reports_on :customers
  join_with :orders
  group_on :customers, :country
  column :customers, :name
  column :orders, :payment_type
  column :orders, :total_price
end
