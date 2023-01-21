require 'test_helper'

class OrderImporterTest < ActiveSupport::TestCase
  def setup
    @test_file_path = 'test/test_files/orders.csv'
    @order = orders(:monday_one)
  end

  def subject
    OrderImporter.new(@test_file_path)
  end

  test '#call creates new Order records' do
    assert_difference -> { Order.count }, 4 do
      subject.call
    end
  end

  test '#call creates new order record with attributes read from csv' do
    subject.call

    order = Order.find_by(id: 11)
    assert_equal order.merchant, merchants(:gouble_store)
    assert_equal order.shopper, shoppers(:adam_krawiec)
    assert_in_delta order.amount, 0.9999e2, 0.1
  end

  test '#call does not update order, when one with id already exists' do
    subject.call

    assert_equal @order, @order.reload
  end
end
