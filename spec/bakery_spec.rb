require "vegemite_scroll"

RSpec.describe VegemiteScroll do
end

require "vegemite_scroll"

describe VegemiteScroll do

  context "input is not a multiple of 5" do
    it "returns error message" do
        expect(VegemiteScroll.new(1)).to receive(:puts).with("We only sell this product in packs of 3 or 5!")
    end
  end
end
