class Disbursement < ApplicationRecord
  belongs_to :merchant
  has_many :orders, through: :merchant

  scope :per_week, -> (local_week) { where(week: Date.parse(local_week.to_s).beginning_of_week )}

  def week_label
    beginning = I18n.l(week.beginning_of_week, format: :long)
    ending = I18n.l(week.end_of_week, format: :long)

    "#{beginning} - #{ending}"
  end
end
