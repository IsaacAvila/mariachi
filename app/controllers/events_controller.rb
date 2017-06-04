class EventsController < ApplicationController
  before_action :get_event, only: [:show, :edit, :update, :destroy]
  before_action :get_selectors, only: [:new, :edit]
  
  def get_event
    @event = Event.find(params[:id])
  end
  
  def get_selectors
    @quotations = Quotation.all.collect { |p| [ p.client, p.id ] }
    @users = User.all.collect { |p| [ p.name, p.id ] }
  end
  
  def index
    @events = Event.all
  end
  
  def show
  end
  
  def edit
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      redirect_to '/error'
    end
  end
  
  def update
    if @event.update_attributes(event_params)
      redirect_to event_path, method: 'show'
    else
      render 'edit'
    end
  end
  
  def destroy
    @event.destroy
    redirect_to events_path
  end
  
  private
  def event_params
    params.require(:event).permit(:name, :user_id, :quotation_id, :date, :time, :address, :city)
  end
end
