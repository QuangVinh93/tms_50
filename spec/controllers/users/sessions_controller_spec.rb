require "rails_helper"
require "users/sessions_controller"

RSpec.describe Users::SessionsController, type: :controller do

  let(:trainee) {FactoryGirl.create :user, :trainee}

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "new user test" do
    get :new
  end

  it "create user test" do
    post :create
  end

  it "destroy user test" do
    sign_in trainee
    delete :destroy
  end
end
