require 'rails_helper'

RSpec.describe Transactions::PostingsController, type: :controller do
  context 'GET index' do
    before do
      @transaction = create(:transaction)
      3.times{ create(:posting, transact: @transaction) }
      get :index, transaction_id: @transaction.id
    end

    it 'respond success' do
      expect(response).to be_success
    end

    it 'assigns variables' do
      expect(assigns(:transaction)).to eq @transaction
      expect(assigns(:postings)).not_to be_empty
    end
  end
end
