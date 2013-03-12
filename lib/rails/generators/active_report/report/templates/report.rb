class <%= class_name %> < ActiveReport::Base
<% if reports_on.empty? -%>
  # reports_on :customers, :orders
<% else -%>
  reports_on <%= reports_on.map { |report| ":#{report.to_sym}" }.sort.join(', ') %>
<% end -%>
end
