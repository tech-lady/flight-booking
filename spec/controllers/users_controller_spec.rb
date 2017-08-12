require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let :new_user do
    {
      first_name: "Someone",
      last_name: "Special",
      email: "someone@yahoo.com",
      password: "password",
      password_confirmation: "password"
    }
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
