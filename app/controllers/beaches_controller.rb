class BeachesController < ApplicationController

    def index
        @beaches = Beach.all 
    end

    def show
        @beach = Beach.find_by_id(params[:id])
    end
end
