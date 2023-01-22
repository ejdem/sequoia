class DisbursementsController < ApplicationController
  def index
    @merchants = Merchant.includes(:disbursements).joins(:disbursements)
                         .then { |q| q.by_id(params[:merchant_id]) }
                         .then { |q| q.with_disbursements(params[:week]) }
  end
end
