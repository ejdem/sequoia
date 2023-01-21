class DisbursementsController < ApplicationController
  def index
    @disburments = Disbursement.active.includes(:merchant).then do |q|
      params[:merchant_id].present? ? q.where(merchant_id: params[:merchant_id]) : q
    end
  end
end
