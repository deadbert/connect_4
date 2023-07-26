require_relative 'spec_helper'

describe GameManager do
  let(:manager) {manager = GameManager.new}
  describe "#initialize" do
    it "exists" do
      
      expect(manager).to be_a(GameManager)
    end
  end
end