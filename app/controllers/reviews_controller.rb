class ReviewsController < ApplicationController



  def create
    @product_id = params[:product_id]
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.product_id = @product_id

    if review.save
      redirect_to product_path(id: @product_id), notice: 'Review created!'
    else
      redirect_to product_path(id: @product_id)
    end

  end

  def remove_item
    @review_id = params[:review_id]
    @product_id = params[:product_id]
    @review = Review.find_by(id: @review_id)
    @review.destroy
    redirect_to product_path(id: @product_id)
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description,
    )
  end

end
