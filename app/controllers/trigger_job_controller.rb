class TriggerJobController < ApplicationController

  def trigger_job
    FetchAirPollutionDataJob.new.perform
    render json: {data: "completed"}
  end
end
