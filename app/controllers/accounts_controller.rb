class AccountsController < ApplicationController
  include RenderWithException

  before_action :get_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    render_with_exception(path: new_account_path) do
      @account = Account.create!(account_params)
      redirect_to accounts_path, { notice: 'Created successfully' }
    end
  end

  def update
    render_with_exception(path: accounts_path) do
      @account.update!(account_params)
      redirect_to accounts_path, { notice: 'Updated successfully' }
    end
  end

  def destroy
    render_with_exception(path: accounts_path) do
      @account.destroy
      redirect_to accounts_path, { notice: 'Deleted Successfully' }
    end
  end

  protected

  def get_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :current_balance)
  end
end
