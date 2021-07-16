class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def new
    @attendance = Attendance.new
    if previous_attendance
      redirect_to root_path, notice: 'You are already listed to attend this event.'
    else
      create
    end
  end

  def create
    @attendance = current_user.attendances.build(attendance_params)
    if @attendance.save
      redirect_to root_path, notice: 'Sign Up to event was successful.'
    else
      render :new
    end
  end

  private

  def attendance_params
    params.permit(:event_id)
  end

  def previous_attendance
    @attendances = Attendance.where(attendance_params)
    flag = false
    @attendances.each do |i|
      flag = true if current_user.id == i.user_id
    end
    flag
  end
end
