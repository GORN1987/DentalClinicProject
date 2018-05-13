class ReporterController < ApplicationController
  def appointment_by_dentist
  end

  def search_appointment_by_dentist
    search = [];
    search[0] = ""

    if params[:search][:dentists_id] != ""
      search[0] = "dentists_id = ?"
      search << params[:appointment][:patients_id]
    end

    if params[:search][:dentists_id] != ""
      search[0] = "dentists_id = ?"
      search << params[:appointment][:patients_id]
    end

  end

end
