class EscalationsController < ApplicationController
    respond_to :json

    before_action :errors
    before_action :set_escalations, only: [:index]
    before_action :set_escalation, only: [:show, :edit, :update, :destroy]

    def show
        respond_with(@escalation)
    end

    def index
        if @errors.empty?
            respond_to { |format| format.json { render json: @escalations, status: 200 } }
        else
            respond_to { |format| format.json { render json: { errors: @errors }, status: 403 } }
        end
    end

    def new

    end

    def create
        @escalation = Escalation.new(escalation_params)

        respond_to do |format|
            if @escalation.save
                format.json { render json: @escalation, status: :created }
            else
                format.json do
                    render json: { errors: @escalation.errors.full_messages } , status: 403
                end
            end
        end
    end

    def edit

    end

    def update
        respond_to do |format|
            if @escalation.update(escalation_params)
              format.json { render json: @escalation, status: :ok }
            else
              format.json do
                render json: { errors: @escalation.errors.full_messages }, status: 403
              end
            end
        end
    end

    def destroy
        @escalation.destroy
    end

    def errors
        @errors = []
    end

    def set_escalations
        @escalations = Escalation.all
    rescue => e
        @errors << e
    end
    
    def set_escalation
        @escalation = Escalation.find(params[:id])
    end

    private

    def escalation_params
        params_list = [:effective_date, :liturgical_time, :observation]
    
        params.permit(params_list)
    end
end
