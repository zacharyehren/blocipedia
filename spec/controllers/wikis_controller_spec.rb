require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:my_wiki) { Wiki.create!(title: Faker::StarWars.quote, body: Faker::StarWars.wookie_sentence) }
  let(:user) { User.create!(email: "zachehren@example.com", password: "abc123" ) }

context "member" do
  before do
    user.member!
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns Wiki.all to wiki" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "initializes wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of wikis by 1" do
        expect( post :create, wiki: {title: "New Wiki Title", body: "New Wiki body"} ).to change(Wiki,:count).by(1)
      end

      it "assigns Wiki.last to @wiki" do
        post( :create, wiki: {title: "New Wiki Title", body: "New Wiki body"} ).to change(Wiki,:count)
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new wiki" do
        post( :create, wiki: {title: "New Wiki Title", body: "New Wiki body"} ).to change(Wiki,:count)
        expect(response).to redirect_to Wiki.last
      end
    end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_wiki.id}
      expect(response).to render_template :show
    end

    it "assigns my_wiki to @wiki" do
      get :show, {id: my_wiki.id}
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_wiki.id}
      expect(response).to render_template :edit
    end

    it "assigns wiki to be updated to @wiki" do
      get :edit, {id: my_wiki.id}
      wiki_instance = assigns(:wiki)

      expect(wiki.instance.id).to eq my_instance.id
      expect(wiki.instance.title).to eq my_instance.title
      expect(wiki.instance.body).to eq my_instance.body
    end
  end

  describe "PUT update" do
    it "updates wiki with expected attributes" do
      new_title = "This is a new title for the wiki"
      new_body = "This is a new body for the wiki"

      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}

      updated_wiki = assigns(:wiki)
      expect(updated_wiki.id).to eq my_wiki.id
      expect(updated.wiki.title).to eq new_title
      expect(updated.wiki.body).to eq new_body
    end

    it "redirects to the updated wiki" do
      new_title = "This is a new title for the wiki"
      new_body = "This is a new body for the wiki"

      put :update, id: my_wiki.id, wiki: {title: new_title, body: new_body}
      expect(response).to redirect_to my_wiki
    end
  end

  describe "DELETE destroy" do
    it "deletes the wiki" do
      delete :destroy, {id: my_wiki.id}
      expect(response).to redirect_to wikis_path
    end
  end
end
end
