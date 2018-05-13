class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  def search_appointments

    search = [];
    search[0] = ""

    if params[:appointment][:patients_id] != ""
      search[0] = "patients_id = ?"
      search << params[:appointment][:patients_id]
    end

    if params[:appointment][:dentists_id] != ""
      if search[0] != ""
        search[0] = search[0] + " and "
      end

      search[0] = search[0] + "dentists_id = ?"
      search << params[:appointment][:dentists_id]
    end

    if params[:appointment][:date1] != ""
      if search[0] != ""
        search[0] = search[0] + " and "
      end
      if search[0] != ""

      end
      search[0] = search[0] + "date(date) >= ?"
      search << params[:appointment][:date1]
    end

    if params[:appointment][:date2] != ""
      if search[0] != ""
        search[0] = search[0] + " and "
      end
      search[0] = search[0] + "date(date) <= ?"

      search << params[:appointment][:date2]

    end
    if search[0] != ""
      @appointments = Appointment.where(search)
    else
      @appointments = Appointment.all
    end
    render "index"
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html {redirect_to @appointment, notice: 'Appointment was successfully created.'}
        format.json {render :show, status: :created, location: @appointment}
      else
        format.html {render :new}
        format.json {render json: @appointment.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html {redirect_to @appointment, notice: 'Appointment was successfully updated.'}
        format.json {render :show, status: :ok, location: @appointment}
      else
        format.html {render :edit}
        format.json {render json: @appointment.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html {redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:date, :fee, :notes, :patients_id, :dentists_id, :specialist_type,:consult_length )
  end
end
