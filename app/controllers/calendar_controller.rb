class CalendarController < ApplicationController
  before_action :authenticate_user!
  def work_calendar

    date = params[:date]

    if date.nil? || date.empty?
      @date = Date.today
    else
      @date = Date.parse(date)
    end

  end
end
