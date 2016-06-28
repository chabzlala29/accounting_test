class Postings::RemovePostingsController < ApplicationController
  def destroy
    @posting = Posting.find(params[:id])
    @posting.destroy
  end
end
