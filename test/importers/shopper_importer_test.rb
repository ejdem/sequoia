require 'test_helper'

class ShopperImporterTest < ActiveSupport::TestCase
  def setup
    @test_file_path = 'test/test_files/shoppers.csv'
    @shopper = shoppers(:adam_krawiec)
  end

  def subject
    ShopperImporter.new(@test_file_path)
  end

  test '#call creates new shopper records' do
    assert_difference -> { Shopper.count }, 1 do
      subject.call
    end
  end

  test '#call does not add shopper, when one with email already exists' do
    assert_no_difference -> { Shopper.where(email: @shopper.email).count } do
      subject.call
    end
  end

  test '#call creates new shopper record with attributes read from csv' do
    subject.call

    shopper = Shopper.find_by(email: 'michiko.bechtelar@example.com')
    assert_equal shopper.name, 'Michiko Bechtelar'
    assert_equal shopper.id, 45
    assert_equal shopper.nif, '56789B'
  end

  test '#call does not update shopper, when one with email already exists' do
    subject.call

    assert_equal @shopper, @shopper.reload
  end
end
