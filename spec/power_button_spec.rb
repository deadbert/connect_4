require_relative 'spec_helper'

describe PowerButton do
  let (:button) {button = PowerBUtton.new}
  describe "#initialize" do
    it "exists" do

      expect(button).to be_a(PowerButton)
    end

    it "initializes with power on" do
      
      expect(button.power).to eq(true)
    end
  end
  
  describe "#off" do
    it "turns the power attribute to false" do
      button.off

      expect(button.power).to eq(false)
    end
  end
end