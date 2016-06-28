class Transactions::PostingsController < ApplicationController
  include RenderWithException

  def index
    @transaction = Transaction.find(params[:transaction_id])
    @postings = @transaction.postings

    respond_to do |f|
      f.html { render 'accounts/postings/index' }
    end
  end
end
