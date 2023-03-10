json.merchants @merchants do |merchant|
  json.extract! merchant, :id, :name

  json.disbursements merchant.disbursements do |disburment|
    json.id disburment.id
    json.week disburment.week_label
    json.amount disburment.amount
  end
end
