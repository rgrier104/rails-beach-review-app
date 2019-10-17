class ReviewsController < ApplicationController

    def new
        @review = Review.new
        @beaches = Beach.all
    end

    def create
    end

    private

    def review_params
    end
end
