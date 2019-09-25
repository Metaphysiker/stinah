class CalendarController < ApplicationController
  before_action :authenticate_user!
  before_action :is_user_allowed?

  include ApplicationHelper

  def work_calendar
    date = params[:date]
    if date.nil? || date.empty?
      @date = Date.today
    else
      @date = Date.parse(date)
    end
  end

  private

  def is_user_allowed?
    if !(is_current_user_admin? || is_current_user_volunteer?)
      #raise "not authorized"
      sign_out current_user
      flash[:notice] = "Sie sind nicht authorisiert!"
      redirect_to root_path
    end
  end
end
