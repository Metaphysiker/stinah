class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :is_user_allowed?

  include ApplicationHelper

  def user_overview
    set_meta_tags noindex: true
  end

  def visits
    set_meta_tags noindex: true
  end

  def create_user

    u = User.new({
      username: params[:new_user][:username],
      firstname: params[:new_user][:firstname],
      lastname: params[:new_user][:lastname],
      email: params[:new_user][:email],
      password: params[:new_user][:password],
      password_confirmation: params[:new_user][:password]
    })

    u.add_role_to_user(params[:new_user][:role])

    #u.confirm
    u.save

    flash[:notice] = "User wurde erstellt!"
    redirect_to user_overview_path

  end

  def add_role_to_user

  end

  def remove_role_to_user

  end

  private

  def is_user_allowed?
    if !is_current_user_admin?
      sign_out current_user
      flash[:notice] = "Sie sind nicht authorisiert!"
      redirect_to root_path
    end
  end

end
