# TODO: add unique email constraint
class Merchant < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :disbursements, dependent: :destroy

  scope :by_id, -> (id) { id.present? ? where(id: id) : all }
  scope :with_disbursements, -> (week) { week.present? ? merge(Disbursement.per_week(week)) : all }
end
