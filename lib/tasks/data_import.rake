#  rake data_import:merchants\['../datasets/merchants.csv'\]
#  rake data_import:shoppers\['../datasets/shoppers.csv'\]
#  rake data_import:orders\['../datasets/orders.csv'\]

namespace :data_import do
  desc 'imports merchants data'
  task :merchants, [:file_path] => :environment do |_, args|
    MerchantImporter.new(args[:file_path]).call
  end

  desc 'imports shoppers data'
  task :shoppers, [:file_path] => :environment do |_, args|
    ShopperImporter.new(args[:file_path]).call
  end

  desc 'imports orders data'
  task :orders, [:file_path] => :environment do |_, args|
    OrderImporter.new(args[:file_path]).call
  end
end
