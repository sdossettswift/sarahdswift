require "test_helper"

describe PortfolioController do
  it "should get welcome" do
    get portfolio_welcome_url
    value(response).must_be :success?
  end

end
