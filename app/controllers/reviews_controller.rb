class ReviewsController < ApplicationController
    before_action :set_review, except: [:index, :new, :create]
    before_action :redirect_if_not_owner, only: [:edit, :update]

    def index
        #if nested, filter for beach
        if params[:beach_id] && @beach = Beach.find_by_id(params[:beach_id])
            @reviews = @beach.reviews
        else
            @reviews = Review.order_by_date.includes(:beach)
        end
    end
    
    def new
        #if nested
        if params[:beach_id] && beach = Beach.find_by_id(params[:beach_id])
            @review = beach.reviews.build
        else
            @review = Review.new
            @review.build_beach
        end
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
    end

    def edit
    end

    def update
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def destroy
        @review.destroy
        redirect_to reviews_path
    end

    private

    def review_params
        params.require(:review).permit(:overall_rating, :overall_description, :parking_rating, :parking_description, :surfing_rating, :surfing_description, :swimming, :snorkeling, :paddleboarding, :sunrise, :sunset, :beach_id, :user_id, :image, beach_attributes: [:name, :city, :shore])
    end

    def set_review
        @review = Review.find_by_id(params[:id])
        redirect_to reviews_path if !@review
    end

    def redirect_if_not_owner
        redirect_to review_path(@review) if current_user.id != @review.user_id
    end

end
