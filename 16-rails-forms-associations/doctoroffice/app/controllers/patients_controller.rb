class PatientsController < ApplicationController

    def index
        @patients = Patient.all

        @images  = ["1-doctor.jpg", "2-doctor.jpg", "3-doctor.jpg", "4-doctor.jpg", "5-doctor.jpg"]
        @random_no = rand(1...5)
        @random_image = @images[@random_no]
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.create(patients_params)
        redirect_to patients_path
    end

    def edit
        @patient = Patient.find(params[:id])
    end

    def update
        @patient = Patient.find(params[:id])
        @patient.update(patients_params)

        redirect_to @patient
    end

    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy
        
        redirect_to patients_path
    end

    private

    def patients_params
        params.require(:patient).permit(:name, :condition, :doctor_id)
    end
end