class MerchantImporter < BaseImporter
  HEADERS = %w(id name email cif)
  COL_IDENTIFIER = :email
  ROW_IDENTIFIER = 'email'
  MODEL = Merchant
end
