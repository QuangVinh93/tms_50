require "rails_helper"

RSpec.describe UsersController, type: :controller do

  let(:user) {FactoryGirl.create :admin}

  before do
    sign_in user
  end

  it "users index test" do
    get :index
  end

  it "show user test" do
    get :show, id: user
  end
end
