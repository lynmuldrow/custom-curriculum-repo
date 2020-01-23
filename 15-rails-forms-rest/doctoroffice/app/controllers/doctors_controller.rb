class DoctorsController < ApplicationController

    def index
        @doctors = Doctor.all
    end

    def show
        @doctor = Doctor.find(params[:id])
    end

    def new
        
    end

    def create
        @doctor = Doctor.create(name: params[:doctor][:name], specialty: params[:doctor][:specialty])
        redirect_to 'index'
    end

    def edit
        find_doctor
    end

    def update
        @doctor = Doctor.find(params[:id])
        @doctor.update(name: params[:doctor][:name], specialty: params[:doctor][:specialty])
    end

    def destroy
       @doctor.destroy
       redirect_to "index"
    end

    private 

    def doctor_params 
        params.require(:doctor).permit(:name)
    end
end
