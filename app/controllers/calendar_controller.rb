class CalendarController < ApplicationController
  before_action :authenticate_user!
  before_action :is_user_allowed?

  include ApplicationHelper

  def work_calendar

    if is_current_user_admin?
      @works = Work.all
    elsif is_current_user_volunteer?
      @works = Work.from_users_with_role("volunteer")
    elsif is_current_user_external_professional?
      @works = Work.where(user_id: current_user.id)
    end

    date = params[:date]
    if date.nil? || date.empty?
      @date = Date.today
    else
      @date = Date.parse(date)
    end
  end

  def work_day_calendar

    if is_current_user_admin?
      @works = Work.all
    elsif is_current_user_volunteer?
      @works = Work.from_users_with_role("volunteer")
    elsif is_current_user_external_professional?
      @works = Work.where(user_id: current_user.id)
    end

    date = params[:date]
    if date.nil? || date.empty?
      @date = Date.today
    else
      @date = Date.parse(date)
    end
  end

  private

  def is_user_allowed?
    if !(is_current_user_admin? || is_current_user_volunteer? || is_current_user_external_professional?)
      #raise "not authorized"
      sign_out current_user
      flash[:notice] = "Sie sind nicht authorisiert!"
      redirect_to root_path
    end
  end

end
