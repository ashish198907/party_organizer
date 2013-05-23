class EventsController < ApplicationController
  layout "admin"

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_url , :notice => "Event successfully created."
    else
      render :action => "new"
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to events_url , :notice => "Event successfully updated."
    else
      render :action => "edit"
    end
  end

  def show
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    render :json => true
  end

end
