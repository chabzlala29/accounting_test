# Work in Progress 

class TransactionsController < ApplicationController
  include RenderWithException

  def index
    @transactions = Transaction.all.active
  end

  def new
    get_transaction_by_session
    if params[:add] == 'true'
      create_posting
      redirect_to new_transaction_path
    end
  end

  def update
    get_transaction_by_session

    @transaction.assign_attributes(transaction_params)

    render_with_exception(path: transactions_path) do
      if @transaction.valid? && @transaction.sufficient_balance?
        @transaction.active!
        reset_transaction_session
        redirect_to transactions_path, { notice: 'Created Successfully' }
      else
        redirect_to new_transaction_path, { notice: @transaction.errors.messages }
      end
    end
  end

  protected

  def transaction_params
    params.require(:transaction).permit(:comment, postings_attributes: [:id, :account_id, :amount, :status])
  end

  def create_posting
    posting = @transaction.postings.new
    posting.save(validate: false)
  end

  def reset_transaction_session
    session[:transaction_id] = nil
  end

  def get_transaction_by_session
    @transaction = if session[:transaction_id]
                     Transaction.find(session[:transaction_id])
                   else
                     set_new_transaction
                   end

    session[:transaction_id] = @transaction.id
  rescue ActiveRecord::RecordNotFound
    reset_transaction_session
    @transaction = set_new_transaction
  end

  def set_new_transaction
    trans = Transaction.new
    trans.save(validate: false)
    trans
  end
end
