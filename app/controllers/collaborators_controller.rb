class CollaboratorsController < ApplicationController
  def create
    @collaborator = current_user.collaborators.new
  end

  def destroy
  end
end
