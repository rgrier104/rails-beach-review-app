class ReviewsController < ApplicationController

    def new
        @review = Review.new
        @beaches = Beach.all
        @review.build_beach
    end

    def create
    end

    private

    def review_params
    end
end
