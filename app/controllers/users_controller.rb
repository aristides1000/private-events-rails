class UsersController < ApplicationController
  def show
    @attendances = Attendance.where(user_id: set_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
