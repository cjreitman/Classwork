require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  subject(:user) { FactoryBot.build(:user, username: "Sergey", password: "mildsauce") }

  describe "GET #index" do 
    it "renders the users index" do 
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do 
    it "displays form to create a user" do 
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do 
    context "with valid params" do
      it "logs in user" do
        post :create, params: { user: {username: "Koy", password: "hotsauce"} }
        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid params" do 
      it "renders create user page" do 
        post :create, params: { user: {username: "Koy", password: ""} }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

  end

end
