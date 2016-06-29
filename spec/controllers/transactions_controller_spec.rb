#require 'rails_helper'

#RSpec.describe TransactionsController, type: :controller do
  #context 'GET index' do
    #before do
      #3.times{ create(:transaction) }
      #get :index
    #end

    #it 'respond success' do
      #expect(response).to be_success
    #end

    #it 'not empty' do
      #expect(assigns(:transactions)).not_to be_empty
    #end
  #end

  #context 'GET new' do
    #it 'respond success' do
      #get :new
      #expect(response).to be_success
    #end

    #it 'assigns @transaction' do
      #get :new
      #expect(assigns(:tranasction)).to be_an_instance_of Transaction
    #end

    #describe 'with add parameter' do
      #before do
        #get :new, add: true
      #end

      #it 'redirects' do
        #expect(response).to be_redirect
      #end

      #it 'create postings' do
        #expect(Posting.last).not_to be_nil
      #end
    #end
  #end

  #context 'PUT update' do
    #before do
      #@transaction = create(:transaction)
      #@transaction.postings.create(build(:posting, account: create(:account)).attributes)

      #put :update, id: @transaction.id, transaction: { comment: 'Change' }
    #end

    #it 'redirects' do
      #expect(response).to be_redirect
    #end

    #it 'assigns @transaction' do
      #expect(assigns(:transaction)).to be_an_instance_of Transaction
    #end

    #it 'updates record' do
      #expect(@transaction.reload.comment).to eq 'Change'
    #end
  #end
#end
