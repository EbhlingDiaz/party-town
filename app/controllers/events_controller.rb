class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  respond_to :html, :json

  def index
    @events = Event.all

    respond_with @events
  end

  def show
    @event = Event.find(params[:id])

    respond_with @event
  end

  def new
    @event = Event.new

    respond_with @event
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    respond_with @event if @event.save    
  end

  def update
    @event = Event.find(params[:id])

    respond_with @event if @event.update_attributes(params[:event])    
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_with @event
  end
end
