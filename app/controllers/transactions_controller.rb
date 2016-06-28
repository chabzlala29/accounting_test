# Work in Progress 

class TransactionsController < ApplicationController
  include RenderWithException

  def index
    @transactions = Transaction.all
  end

  def new
    get_transaction_by_session

    if request.xhr?
      create_posting
    end
  end

  def update
    get_transaction_by_session

    render_with_exception(path: transactions_path) do
      if @transaction.update(transaction_params)
        reset_transaction_session
        redirect_to transactions_path, { notice: 'Created Successfully' }
      else
        @transaction.destroy
        reset_transaction_session
        redirect_to new_transaction_path, { notice: @transaction.errors['sum'].first }
      end
    end
  end

  protected

  def transaction_params
    params.require(:transaction).permit(:comment, postings_attributes: [:id, :account_id, :amount, :status])
  end

  def create_posting
    @transaction.postings.create
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
  end

  def set_new_transaction
    trans = Transaction.new
    trans.save(validate: false)
    trans
  end
end
