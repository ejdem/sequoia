module Disbursements
  class Calculator
    # merchant - merchant
    # week - current week (will get orders for previous week)
    def initialize(merchant, week)
      @merchant = merchant
      @week = Date.parse(week).last_week.beginning_of_week
    end

    def call
      disbursement = merchant.disbursements.per_week(week).first_or_initialize
      disbursement.week = week

      total_fee = disbursement.orders.completed_for_week(week).pluck(:amount).sum { |a| a * fee(a) }
      disbursement.amount = total_fee.round(2)
      disbursement.save
    end

    private

    attr_reader :merchant, :week

    def fee(amount)
      fee_rate(amount) / 100
    end

    def fee_rate(amount)
      1.0 if amount < 50

      return 0.95 if amount >= 50 && amount < 300

      0.85
    end
  end
end
