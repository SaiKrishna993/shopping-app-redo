class Order < ApplicationRecord

  belongs_to :product
  belongs_to :admin
  belongs_to :user
end