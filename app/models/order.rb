class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  scope :completed, -> { where.not(completed_at: nil) }

  def self.completed_for_week(week)
    week = Date.parse(week)

    where(created_at: week.beginning_of_week..week.end_of_week).completed
  end
end
