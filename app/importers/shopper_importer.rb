class ShopperImporter < BaseImporter
  HEADERS = %w(id name email nif)
  COL_IDENTIFIER = :email
  ROW_IDENTIFIER = 'email'
  MODEL = Shopper
end
