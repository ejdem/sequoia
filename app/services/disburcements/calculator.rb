module Disbursements
  class Calculator
    def initialize(merchant, week)
      @merchant = merchant
      @week = week
    end

    def call
      disbursement = merchant.disbursements.new
      disbursement.created_at = week

      total_fee = disbursement.orders.completed_for_week(week).pluck(:amount).sum { |a| a * fee(a) }
      disbursement.amount = total_fee
      disburment.save
    end

    private

    attr_reader :merchant, :week

    def fee(amount)
      fee_rate(amount) / 100
    end

    def fee_rate(amount)
      1 if amount < 50

      return 0.95 if amount >= 50 && amount < 300

      0.85
    end
  end
end
