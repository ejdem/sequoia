# TODO: add unique email constraint
class Merchant < ApplicationRecord
  has_many :orders, dependent: :destroy
end
