require 'spec_helper'

desccribe Contractors::PasswordsController do

  context "GET" do
    specify "#update" do
      post("/contractors/password/new").should route_to("contractors/passwords#new")
    end

    specify "#update" do
      post("/contractors/password/edit").should route_to("contractors/passwords#edit")
    end
  end

  context "PUT" do
    specify "#update" do
      post("/contractors/password").should route_to("contractors/passwords#update")
    end
  end

  context "POST" do
    specify "#create" do
      post("/contractors/password").should route_to("contractors/passwords#create")
    end
  end

  context "DELETE" do
    specify "#destroy" do
      post("/contractors/password").should route_to("contractors/passwords#destroy")
    end
  end

end