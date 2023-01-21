# TODO: add unique email constraint
class Shopper < ApplicationRecord
  has_many :orders, dependent: :destroy
end
