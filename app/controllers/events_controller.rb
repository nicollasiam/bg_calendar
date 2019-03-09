class EventsController < ApplicationController
  before_action :find_event, except: %i[index new create]

  def index
    @events = Event.all
  end

  def show; end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)

    if event.save
      redirect_to event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
