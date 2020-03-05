class ReviewsController < ApplicationController
  def index
    render json: Review.where(status: Review.statuses[index_params[:status]])
  end

  private

  def index_params
    params.require(:reviews).permit(:user_id, :status)
  end
end
