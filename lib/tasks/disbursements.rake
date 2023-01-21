namespace :disbusements do
  desc 'Calculates proper total fee amount per merchant'
  task calculator: :environment do
    Merchant.find_each do |merchant|
      weeks = merchant.orders.order(created_at: :asc).pluck(:created_at).map do |week|
        Date.parse(week.to_s).beginning_of_week.to_s
      end.uniq

      weeks.map do |week|
        Disbursements::Calculator.new(merchant, week.to_s).call
      end
    end
  end
end
