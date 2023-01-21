class Disbursement < ApplicationRecord
  belongs_to :merchant
  has_many :orders, through: :merchant

  def week
    beginning = I18n.l(created_at.beginning_of_week, format: :long)
    ending = I18n.l(created_at.end_of_week, format: :long)

    "#{beginning} - #{ending}"
  end
end
