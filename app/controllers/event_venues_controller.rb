class EventVenuesController < ApplicationController
  def new
  	@event_venues= EventVenue.new
  end

  def create
  	@event_venue = EventVenue.new(params[:event_venue])

    respond_to do |format|
      if @event_venue.save
        format.html {redirect_to @event_venue, notice: "Event Venue was successfully created" }
        format.json {render json: @event_venue, status: :created, location: @event_venue}

      else
        format.html { render action: "new" }
        format.json { render json: @event_venue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	@event_venue = EventVenue.find(params[:id])
    if @event_venue.update(event_venue_params)

      format.html {redirect_to @event_venue, notice: "Event Venue was successfully destroyed" }
      format.json {render json: @event_venue, status: :created, location: @event_venue}

    end
  end

  def destroy
  	@event_venue = EventVenue.find(params[:id])
    @event_venue.destroy
    respond_to do |format|

      format.html {redirect_to @event_venue, notice: "Event Venue was destroyed" }
      format.json {render json: message: "removed"}
    end
  end

  def show
  end

  def event_venue_params
    params.require(:event_venue).permit(:name,:location ,:capacity)
  end
end
