require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  subject!(:user) { User.create(username: "Koy", password: "hotsauce") }

  describe "GET #new" do 
    it "renders login page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do 
    context "with valid credentials" do
      it "redirects to users index page" do
        post :create, params: { user: {username:"Koy", password: "hotsauce"} }
        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid credentials" do
      it "renders create user page" do
        post :create, params: { user: {username:"Koy", password: "mildsauce"} }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do 
      post :create, params: { user: {username:"Koy", password: "hotsauce"} }
      @session_token = User.find_by_credentials("Koy", "hotsauce").session_token
    end
      
    it "it logs out the user" do 
      delete :destroy 
      expect(@session_token).to_not eq(session[:session_token])
    end
  end

end
