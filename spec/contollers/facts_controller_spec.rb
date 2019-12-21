require 'rails_helper'

RSpec.describe FactsController, type: :controller do
  describe "facts#show action" do
    it "should successfully show the page if fact is found" do
      fact = post :create, params: { fact: { title: "Food", blurb: "What living beings use for energy", category: "other" } }
      get :show, params { id: fact.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the fact is not found" do
      get :show, params: { id: 'TACOCAT' }
      expect(response).to have_http_status(:not_found)
    end
    
  describe "facts#index action" do
    it "should successfully show the page" do
      get :index
    end
  end

  describe "facts#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form" do

      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe "facts#create action" do
    it "should require users to be logged in" do
      post :create, params: { fact: { title: "Food", blurb: "What living beings use for energy", category: "other" } }
      expect(response).to redirect_to new_user_session_path
    end
    it "should successfully create a new fact in our database" do
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user
      post :create, params: { fact: { title: "Food", blurb: "What living beings use for energy", category: "other"} }
      expect(response).to redirect_to root_path

      fact = Fact.last
      expect(fact.title).to eq("Food")
      expect(fact.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      fact_count = Fact.count
      post :create, params: { fact: { title: ''} }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Fact.count).to eq Fact.count
    end
  end
end
