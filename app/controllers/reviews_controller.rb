class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end
    
    def new
        @review = Review.new
        @beaches = Beach.all
        @review.build_beach
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:overall_rating, :overall_description, :parking_rating, :parking_description, :surfing_rating, :surfing_description, :swimming, :snorkeling, :paddleboarding, :sunrise, :sunset, :beach_id, :user_id, beach_attributes: [:name, :city, :shore])
    end
end
