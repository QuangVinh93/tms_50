require "rails_helper"

describe "admin/course_subjects/edit.html.erb", type: :view do
  it "render _task_form" do
    expect(view).to render_template(partial: "_task_form")
  end

  it "check action" do
    expect(controller.request.path_parameters[:action]).to eq("edit")
  end
end
