class TicketTypesController < ApplicationController
  def new
    @ticket_types = TicketType.new
  end

  def create
    @ticket_type = TicketType.new(params[:ticket_type])

    respond_to do |format|
      if @ticket_type.save
        format.html {redirect_to @ticket_type, notice: "Ticket Type was successfully created" }
        format.json {render json: @ticket_type, status: :created, location: @ticket_type}

      else
        format.html { render action: "new" }
        format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
      end
    ends
  end

  def update
    @ticket_type = TicketType.find(params[:id])
    if @ticket_type.update(ticket_type_params)

      format.html {redirect_to @ticket_type, notice: "Ticket Type was successfully destroyed" }
      format.json {render json: @ticket_type, status: :created, location: @ticket_type}

    end
  end

  def destroy
    @ticket_type = TicketType.find(params[:id])
    @ticket_type.destroy
    respond_to do |format|

      format.html {redirect_to @ticket_type, notice: "Ticket Type was destroyed" }
      format.json {render json: message: "removed"}
    end
  end

  def show
  end

  def ticket_type_params
    params.require(:ticket_type).permit(:type, :price)
  end
end
