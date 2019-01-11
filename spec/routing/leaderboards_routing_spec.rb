require "rails_helper"

RSpec.describe LeaderboardsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/leaderboards").to route_to("leaderboards#index")
    end

    it "routes to #new" do
      expect(:get => "/leaderboards/new").to route_to("leaderboards#new")
    end

    it "routes to #show" do
      expect(:get => "/leaderboards/1").to route_to("leaderboards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/leaderboards/1/edit").to route_to("leaderboards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/leaderboards").to route_to("leaderboards#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/leaderboards/1").to route_to("leaderboards#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/leaderboards/1").to route_to("leaderboards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/leaderboards/1").to route_to("leaderboards#destroy", :id => "1")
    end

  end
end
