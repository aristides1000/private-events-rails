class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def new
    @attendance = Attendance.new
    @par = params[:event_id]
    @user = current_user.id
    create
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
end
