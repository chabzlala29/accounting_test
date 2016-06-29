require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  context 'GET index' do
    before do
      3.times{ create(:account) }
      get :index
    end

    it 'respond success' do
      expect(response).to be_success
    end

    it 'not empty' do
      expect(assigns(:accounts)).not_to be_empty
    end
  end

  context 'GET new' do
    before do
      get :new
    end

    it 'respond success' do
      expect(response).to be_success
    end

    it 'assigns @account' do
      expect(assigns(:account)).to be_an_instance_of Account
    end
  end

  context 'POST create' do
    before do
      post :create, { account: { name: 'Test Account', current_balance: 1000 }}
    end

    it 'redirects' do
      expect(response).to be_redirect
    end

    it 'assigns @account' do
      expect(assigns(:account)).to be_an_instance_of Account
    end

    it 'account created' do
      expect(Account.count > 0).to eq true
    end
  end

  context 'PUT update' do
    before do
      @account = create(:account)
      put :update, id: @account.id, account: { name: 'Updated Name' }
    end

    it 'redirects' do
      expect(response).to be_redirect
    end

    it 'assigns @account' do
      expect(assigns(:account)).to be_an_instance_of Account
      expect(assigns(:account)).to eq @account.reload
    end

    it 'updates record' do
      expect(@account.reload.name).to eq 'Updated Name'
    end
  end

  context 'DELETE destroy' do
    before do
      @account = create(:account)
      xhr :delete, :destroy, id: @account.id
    end

    it 'redirects' do
      expect(response).to be_redirect
    end

    it 'assigns @account' do
      expect(assigns(:account)).to eq @account
    end

    it 'deletes record' do
      expect{ Posting.find(@account.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
