require 'rails_helper'
require 'pp'

RSpec.describe RantsController, type: :controller do

  describe "#index" do
    it "returns json of all user rants" do
      user = create_user
      rant = create_rant(user_id: user.id)

      get :index, user_id: user.id

      expect(response.status).to be(200)
      response_array = JSON.parse(response.body)["rants"]
      expect(response_array[0]["title"]).to eq(rant.title)
    end
  end

  describe '#show' do
    it "returns json of one user rant" do
      user = create_user
      rant1 = create_rant(user_id: user.id)
      rant2 = create_rant(user_id: user.id)

      get :show, user_id: user.id, id: rant1.id
      expect(response.status).to be(200)
      response_array = JSON.parse(response.body)["rants"]
      expect(response_array[0]["title"]).to eq(rant1.title)
    end
  end


  describe '#create' do
    it "returns json of one user rant" do
      user = create_user
      post :create, user_id: user.id , rant: {user_id: user.id, title: "new title", body: "new body"}
      expect(response.status).to be(200)
    end
  end


  describe '#update' do
    it "returns json of an updated user rant" do
      user = create_user
      rant = create_rant(user_id: user.id)
      patch :update, user_id: user.id, id: rant.id, rant: {body: "new body"}
      expect(response.status).to be(200)
      response_array = JSON.parse(response.body)["rants"]
      expect(rant.reload.body).to eq("new body")
    end
  end

  describe '#destroy' do

    it "removes json rants from user" do
      user = create_user
      rant = create_rant(user_id: user.id)

      delete :destroy, user_id: user.id, id: rant.id
      expect(response.status).to be(200)
      response_array = JSON.parse(response.body)
      expect(response_array).to eq("rants"=>[])
    end



  end


end
