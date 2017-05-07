class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.email = params[:user][:email]
    @user.role = params[:user][:role]

    # authorize @user

      if @user.save
        flash[:notice] = "User was updated."
        redirect_to :root
      else
        flash.now[:alert] = "There was an error saving the User. Please try again."
        render :edit
      end
  end

end
