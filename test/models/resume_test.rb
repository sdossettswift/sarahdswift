require "test_helper"

describe Resume do
  let(:resume) { Resume.new }

  it "must be valid" do
    value(resume).must_be :valid?
  end
end
