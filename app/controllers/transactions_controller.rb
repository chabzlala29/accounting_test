# Work in Progress 

class TransactionsController < ApplicationController
  include RenderWithException

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
    if params[:postings_count] && params[:postings_count].is_a?(Integer)
      params[:postings_count].times do
      end
    else
      @transaction.postings.new
    end
  end

  def create
    render_with_exception(transactions_path) do
      @transaction.create_transaction(transaction_params)
      redirect_to @transaction, { notice: 'Created Successfully' }
    end
  end

  protected

  def transaction_params
    params.require(:transaction).permit(:comment)
  end
end
