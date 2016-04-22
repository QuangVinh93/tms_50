require "rails_helper"

describe "admin/courses/index.html.erb", type: :view do
  let(:course) {FactoryGirl.create :course}
  let(:courses) {Course.all}
  let(:subjects) {Subject.all}
  let(:activities) {PublicActivity::Activity.all}
  let(:members) {User.all}

  before do
    assign :course, course
    assign :activities, activities
    assign :members, members
    assign :courses, courses.page
    assign :subjects, subjects

    render
  end

  it "render _course_form" do
    expect(view).to render_template(partial: "_course_form")
  end

  it "check action" do
    expect(controller.request.path_parameters[:action]).to eq("index")
  end
end

describe "admin/courses/show.html.erb", type: :view do
  it "check action" do
    expect(controller.request.path_parameters[:action]).to eq("show")
  end
end
