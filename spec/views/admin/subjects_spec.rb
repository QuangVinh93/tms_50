require "rails_helper"

describe "admin/subjects/index.html.erb", type: :view do
  let(:subject) {FactoryGirl.create :subject}
  let(:subjects) {Subject.all}
  let(:activities) {PublicActivity::Activity.all}

  before do
    assign :activities, activities
    assign :subjects, subjects.page
    assign :subject, subject

    render
  end

  it "render _subject_form" do
    expect(view).to render_template(partial: "_subject_form")
  end

  it "render _task_fields" do
    expect(view).to render_template(partial: "_task_fields")
  end

  it "check action" do
    expect(controller.request.path_parameters[:action]).to eq("index")
  end
end
