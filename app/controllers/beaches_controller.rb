class BeachesController < ApplicationController

    def index
        @beaches = Beach.order_by_rating.includes(:reviews)
    end

    def show
        @beach = Beach.find_by_id(params[:id])
    end
end
