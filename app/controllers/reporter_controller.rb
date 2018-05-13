class ReporterController < ApplicationController
  def appointment_by_dentist


  end


  def search_appointment_by_dentist
    search = [];
    search[0] = ""

    if params[:search][:dentists_id] != ""
      if search[0] != ""
        search[0] = search[0] + " and "
      end

      search[0] = search[0] + "dentists_id = ?"
      search << params[:search][:dentists_id]
    end

    if params[:search][:date1] != ""
      if search[0] != ""
        search[0] = search[0] + " and "
      end
      if search[0] != ""

      end
      search[0] = search[0] + "date(date) >= ?"
      search << params[:search][:date1]
    end

    if params[:search][:date2] != ""
      if search[0] != ""
        search[0] = search[0] + " and "
      end
      search[0] = search[0] + "date(date) <= ?"

      search << params[:search][:date2]

      @appointments = Appointment.select("date(date) date ,count(*) qtt, sum(fee) fee").
          where(search).
          group("date(date)").
          order("date DESC")

      render "appointment_by_dentist"

    end

  end

  def appointment_by_patient


  end

  def search_appointment_by_patient
    search = [];
    search[0] = ""

    if params[:search][:dentists_id] != ""
      if search[0] != ""
        search[0] = search[0] + " and "
      end

      search[0] = search[0] + "dentists_id = ?"
      search << params[:search][:dentists_id]
    end

    if params[:search][:date1] != ""
      if search[0] != ""
        search[0] = search[0] + " and "
      end
      if search[0] != ""

      end
      search[0] = search[0] + "date(date) >= ?"
      search << params[:search][:date1]
    end

    if params[:search][:date2] != ""
      if search[0] != ""
        search[0] = search[0] + " and "
      end
      search[0] = search[0] + "date(date) <= ?"

      search << params[:search][:date2]

      @appointments = Appointment.select(" date, patients_id, notes, specialist_type , fee").
          where(search).
          order("date")

      render "appointment_by_patient"

    end

  end


end
