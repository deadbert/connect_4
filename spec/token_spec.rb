require_relative 'spec_helper'

describe Token do
  describe "#initialize" do
    token = Token.new
    it "exists" do

      expect(token).to be_a(Token)
    end

    it "has a default '.' type attribute" do

      expect(token.type).to eq(".")
    end
  end
end