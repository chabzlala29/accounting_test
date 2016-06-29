require 'rails_helper'

RSpec.describe Postings::RemovePostingsController, type: :controller do
  context 'DELETE destroy' do
    before do
      @posting = create(:posting)
      xhr :delete, :destroy, id: @posting.id
    end

    it 'respond success' do
      expect(response).to be_success
    end

    it 'assigns @posting' do
      expect(assigns(:posting)).to eq @posting
    end

    it 'deletes record' do
      expect{ Posting.find(@posting.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
