class CalendarController < ApplicationController
  before_action :authenticate_user!
  def calendar

    date = params[:date]

    if date.nil? || date.empty?
      @date = Date.today
    else
      @date = Date.parse(date)
    end

  end
end
