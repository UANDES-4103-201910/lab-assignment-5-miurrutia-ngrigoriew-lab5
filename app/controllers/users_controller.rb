class UsersController < ApplicationController
  def new
  	@users = User.new
  end

  def create
	@user = User.new(params[:user])

	respond_to do |format|
	  if @user.save
	    format.html {redirect_to @user, notice: "User was successfully created" }
	    format.json {render json: @user, status: :created, location: @user}

	  else
	    format.html { render action: "new" }
	    format.json { render json: @user.errors, status: :unprocessable_entity }
	  end
	end
  end

  def update
  	@user = User.find(params[:id])
	if @user.update(user_params)

		format.html {redirect_to @user, notice: "User was successfully destroyed" }
	  	format.json {render json: @user, status: :created, location: @user}

	end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
		format.html {redirect_to @user, notice: "User was destroyed" }
	    format.json {render json: message: "removed"}
	end
    	
  end

  def show
  end

  def user_params
  	params.require(:user).permit(:name, :lastname, :phone)
  end
end
