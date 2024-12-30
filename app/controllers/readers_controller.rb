class ReadersController < ApplicationController
    respond_to :json

    before_action :errors
    before_action :set_readers, only: [:index]
    before_action :set_reader, only: [:show, :edit, :update, :destroy]

    def show
        respond_with(@reader)
    end

    def index
        if @errors.empty?
            respond_to { |format| format.json { render json: @readers, status: 200 } }
        else
            respond_to { |format| format.json { render json: { errors: @errors }, status: 403 } }
        end
    end

    def new

    end

    def create
        @reader = Reader.new(reader_params)

        respond_to do |format|
            if @reader.save
                format.json { render json: @reader, status: :created }
            else
                format.json do
                    render json: { errors: @reader.errors.full_messages } , status: 403
                end
            end
        end
    end

    def edit

    end

    def update
        respond_to do |format|
            if @reader.update(reader_params)
              format.json { render json: @reader, status: :ok }
            else
              format.json do
                render json: { errors: @reader.errors.full_messages }, status: 403
              end
            end
        end
    end

    def destroy

    end

    def errors
        @errors = []
    end

    def set_readers
        @readers = Reader.all
    rescue => e
        @errors << e
    end
    
    def set_reader
        @reader = Reader.find(params[:id])
    end

    private

    def reader_params
        params_list = [:name, :email, :phone_number, :birthday]
    
        params.permit(params_list)
    end

end
