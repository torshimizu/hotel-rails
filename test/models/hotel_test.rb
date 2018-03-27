require "test_helper"

describe Hotel do
  let(:hotel) { Hotel.new }

  it "must be valid" do
    value(hotel).must_be :valid?
  end
end
