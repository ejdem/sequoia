require 'test_helper'

class MerchantImporterTest < ActiveSupport::TestCase
  def setup
    @test_file_path = 'test/test_files/merchants.csv'
  end

  def subject
    MerchantImporter.new(@test_file_path)
  end

  test '#call creates new merchant records' do
    assert_difference -> { Merchant.count }, 2 do
      subject.call
    end
  end

  test '#call creates new merchant record with attributes read from csv' do
    subject.call

    merchant = Merchant.find_by(email: 'my-friends@example.com')
    assert_equal merchant.name, 'my business, and friends'
    assert_equal merchant.id, 45
    assert_equal merchant.cif, 'B56789'
  end

  test '#call does not add merchant, when one with email already exists' do
    Merchant.create(id: '33',
                    name: 'my business not LTD',
                    email: 'my-business@example.com',
                    cif: 'A12345')

    assert_difference -> { Merchant.count }, 1 do
      subject.call
    end
  end

  test '#call does not update merchant, when one with email already exists' do
    merchant = Merchant.create(id: '33',
                               name: 'my business not LTD',
                               email: 'my-business@example.com',
                               cif: 'A12345')


    subject.call

    assert_equal merchant, merchant.reload
  end
end
