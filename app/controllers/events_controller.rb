class EventsController < ApplicationController

  def new
    @events = Event.new
  end

  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html {redirect_to @event, notice: "Event was successfully created" }
        format.json {render json: @event, status: :created, location: @event}

      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)

      format.html {redirect_to @event, notice: "Event was successfully destroyed" }
      format.json {render json: @event, status: :created, location: @event}

    end

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      
      format.html {redirect_to @event, notice: "Event was destroyed" }
      format.json {render json: message: "removed"}
    end
  end

  def show
  end

  def event_params
    params.require(:event).permit(:name, :location)
  end


end
