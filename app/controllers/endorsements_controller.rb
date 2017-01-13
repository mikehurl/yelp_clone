class EndorsementsController < ApplicationController

  def index
    @endorsements = Endorsement.all
    redirect_to restaurants_path
  end

  def create
    @review = Review.find(params[:review_id])
    @review.endorsements.create
    render json: {new_endorsement_count: @review.endorsements.count}
  end
end
