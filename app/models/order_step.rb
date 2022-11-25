class OrderStep < ApplicationRecord
  belongs_to :order
  belongs_to :step
end
