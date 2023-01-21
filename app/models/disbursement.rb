class Disbursement < ApplicationRecord
  belongs_to :merchant
  has_many :orders, through: :merchant

  scope :active, -> { where(created_at: Time.current.all_week) }
end
