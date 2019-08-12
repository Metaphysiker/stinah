class CalendarController < ApplicationController
  def calendar
    @date = Date.today
  end
end
