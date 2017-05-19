module CollaboratorsHelper

  def collaborator_id
    user_id = params[:collaborator][:user_id]
    wiki_id = params[:collaborator][:wiki_id]
  end

end
