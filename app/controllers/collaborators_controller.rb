class CollaboratorsController < ApplicationController
  def create
    user_id = params[:collaborator][:user_id]
    wiki_id = params[:collaborator][:wiki_id]

    collaborator = Collaborator.new(user_id: user_id, wiki_id: wiki_id)

    if collaborator.save
      flash[:notice] = "Collaborator has been saved and now has access to this Wiki."
      redirect_to :back
    else
      flash[:alert] = "Collborator has not been saved. Please try again."
      redirect_to :back
    end
  end

  def destroy
    collaborator = Collaborator.find(params[:collaborator][:user_id])

    if collaborator.destroy
      flash[:notice] = "The collaborator was deleted successfully."
      redirect_to :back
    else
      flash.now[:alert] = "There was an removing the collaborator."
      redirect_to :back
    end
  end
end
