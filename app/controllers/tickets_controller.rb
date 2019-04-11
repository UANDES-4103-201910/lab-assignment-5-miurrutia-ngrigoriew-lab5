class TicketsController < ApplicationController
  def create
  	@ticket = Ticket.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        format.html {redirect_to @ticket, notice: "Ticket was successfully created" }
        format.json {render json: @ticket, status: :created, location: @ticket}

      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@ticket = Ticket.find(params[:id])
    @ticket.destroy
    respond_to do |format|

	    format.html {redirect_to @ticket, notice: "Ticket was destroyed" }
	    format.json {render json: message: "removed"}
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      format.html {redirect_to @ticket, notice: "Ticket was successfully destroyed" }
      format.json {render json: @ticket, status: :created, location: @ticket}
    end
  end

  def new
  	@tickets = Ticket.new

  end

  def show
  end

  def ticket_params
  	params.require(:ticket).permit(:location, :date)
  end
end
