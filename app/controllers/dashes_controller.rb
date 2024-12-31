class DashesController < ApplicationController
    respond_to :json

    before_action :errors
    before_action :set_dash, only: [:show]

    def show
        respond_with(@dash)
    end
    
    def set_dash
        @dash = Dash.find(params[:id])
    end
end
