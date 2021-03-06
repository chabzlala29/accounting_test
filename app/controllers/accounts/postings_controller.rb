class Accounts::PostingsController < ApplicationController
  include RenderWithException

  def index
    @account = Account.find(params[:account_id])
    @postings = @account.postings.active_transact
  end
end
