json.disburments @disburments do |disburment|
  json.extract disburment, :id, :value

  json.merchant do
    json.id disburment.merchant_id
    json.name disburment.merchant.name
  end
end
