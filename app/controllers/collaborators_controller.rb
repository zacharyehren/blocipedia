class CollaboratorsController < ApplicationController
  def create
    @user_id = params[:collaborator][:user_id]
    @wiki_id = params[:collaborator][:wiki_id]

    @user_id.each do |c|
      if c.false?
        @user_id.build(:collaborator)
      end
    end

    if @user_id.save
      flash[:notice] = "Collaborator has been saved and now has access to this Wiki."
      redirect_to @wiki_id
    else
      flash[:alert] = "Collborator has not been saved. Please try again."
    end
  end

  def destroy
  end
end
