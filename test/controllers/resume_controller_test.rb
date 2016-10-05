require "test_helper"

describe ResumeController do
  it "should get resume" do
    get resume_resume_url
    value(response).must_be :success?
  end

end
