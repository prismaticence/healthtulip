class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@treatment = Treatment.all
	end

	def create
		@review = Review.new(reviewparams)
		@review.user_id = current_user.id
		if @review.save
			flash[:notice] = "Your review has been saved"
			redirect_to treatments_path
		else
			flash[:error] = "Your review was not saved"
			render 'new'
		end
	end

	def show
		@review = Review.find(params[:id])
	end

	private
	def reviewparams
		params.require(:review).permit!
	end
end