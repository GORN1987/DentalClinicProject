class SearchAppointmentsController < ApplicationController

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
    render "appointments/index"
  end
end
