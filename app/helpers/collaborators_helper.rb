module CollaboratorsHelper

  def find_collaborator(user_id, wiki_id)
    Collaborator.where(user_id: user_id, wiki_id: wiki_id)
  end

end
