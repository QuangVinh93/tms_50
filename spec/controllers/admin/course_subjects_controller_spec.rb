require "rails_helper"

RSpec.describe Admin::CourseSubjectsController, type: :controller do

  let(:user) {FactoryGirl.create :admin}
  let(:subject) {FactoryGirl.create :subject}
  let(:course) {FactoryGirl.create :course}
  let(:course_subject) {FactoryGirl.create :course_subject}

  before do
    sign_in user
    request.env["HTTP_REFERER"] = admin_course_path(course)
    allow(CourseSubject).to receive(:find).and_return course_subject
  end

  it "update course subject test" do
    patch :update, id: course_subject,
      course_subject: ActionController::Parameters.new(subject_id: subject,
      course_id: course, status: :started)
  end

  context "update user subjects fail" do
    before do
      allow(course_subject).to receive(:update_attributes).and_return false
      patch :update, id: course_subject,
        course_subject: ActionController::Parameters.new(subject_id: subject,
        course_id: course, status: :started)
    end
    it {expect(response).to redirect_to admin_course_path(course_subject.course)}
  end
end
