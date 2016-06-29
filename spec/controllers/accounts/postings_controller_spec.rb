require 'rails_helper'

RSpec.describe Accounts::PostingsController, type: :controller do
  context 'GET index' do
    before do
      @account = create(:account)
      @transaction = create(:transaction)
      3.times{ create(:posting, account: @account, transact: @transaction) }
      get :index, account_id: @account.id
    end

    it 'respond success' do
      expect(response).to be_success
    end

    it 'assigns variables' do
      expect(assigns(:account)).to eq @account
      expect(assigns(:postings)).not_to be_empty
    end
  end
end
