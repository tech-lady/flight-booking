# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let :new_user do
    {
      first_name: "Yems",
      last_name: "Kems",
      email: "someone@yahoo.com",
      password: "Hello",
      password_confirmation: "hello"
    }
  end

  describe "POST #create" do
    it "redirects to signed in page" do
      post(:create, params: { user: new_user })
      expect(controller).to respond_with(302)
    end
  end
end
