class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :startdate, :enddate, :allday, :memo))
    if @schedule.save
      flash[:notice] = "You successed to create new schedule"
      redirect_to :schedules
    else
      render "new"
    end
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :startdate, :enddate, :allday, :memo))
      flash[:notice] = "You successed to edit the schedule"
      redirect_to :schedules
    else
      render "edit"
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id]) 
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "schedule was deleted"
    redirect_to :schedules
  end
end
