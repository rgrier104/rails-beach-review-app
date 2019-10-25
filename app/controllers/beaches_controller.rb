class BeachesController < ApplicationController

    def index
        if !params[:shore].blank?
            @beaches = Beach.by_shore(params[:shore])
        else
            @beaches = Beach.order_by_rating.includes(:reviews)
        end
    end

    def show
        @beach = Beach.find_by_id(params[:id])
    end
end
