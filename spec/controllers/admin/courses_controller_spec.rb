require "rails_helper"

describe Admin::CoursesController, type: :controller do
  let(:user) {FactoryGirl.create :admin}
  let(:course) {FactoryGirl.create :course}
  let(:user_course) {FactoryGirl.create :user_course, course_id: 1}
  subject{{user: user, course: course, user_course: user_course}}

  before(:each) do
    sign_in subject[:user]
    request.env["HTTP_REFERER"] = admin_courses_path
    allow(Course).to receive(:find).and_return course
  end

  it "show course test" do
    get :show, id: subject[:course]
  end

  it "index courses test" do
    get :index, id: subject[:course]
  end

  it "update courses success test" do
    course_params = ActionController::Parameters.
      new(course: {status: :finished})
    patch :update, id: subject[:course], course: course_params
  end

  context "update user subjects fail" do
    before do
      allow(course).to receive(:update_attributes).and_return false
      put :update, id: course.id, course:
        {name: "test"}
    end
    it {expect(response).to render_template :index}
  end

  describe "#create_activity" do
    context "update user subjects fail" do
      before do
        allow(course).to receive(:update_attributes).and_return false
        put :update, id: course.id, course:
          {name: "test"}
      end
      it {expect(response).to render_template :index}
    end
  end

  it "destroy course success test" do
    delete :destroy, id: subject[:course]
  end

  context "destroy course fail" do
    before do
      allow(course).to receive(:destroy).and_return false
      delete :destroy, id: course
    end
    it {expect(response).to render_template :index}
  end

  it "create course fail test" do
    course_params = ActionController::Parameters.
      new(course: {status: :finished})
    post :create, course: course_params
  end

  it "create course success test" do
    course_params = FactoryGirl.attributes_for(:course)
    course_params[:status] = :finished
    post :create, course: course_params
  end
end
