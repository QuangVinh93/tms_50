require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do

  let(:trainee) {FactoryGirl.create :user, :trainee}

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "new user test" do
    get :new
  end

  it "create user test" do
    post :create
  end

  it "edit user test" do
    sign_in trainee
    get :edit
  end

  it "update user test" do
    sign_in trainee
    patch :update
  end
end
