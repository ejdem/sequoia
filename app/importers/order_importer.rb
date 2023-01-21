class OrderImporter < BaseImporter
  HEADERS = %w(id merchant_id shopper_id amount created_at completed_at)
  COL_IDENTIFIER = :id
  ROW_IDENTIFIER = 'id'
  MODEL = Order
end
