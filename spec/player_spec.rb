require_relative 'spec_helper'
describe Player do 
  let (:dave) {dave = Player.new("x")}
  describe "set-up" do
    it "t1 exits and has type" do
      expect(dave).to be_a(Player)
    end

  describe "actions" do
    it "can place a piece"
    it "piece is on its team"
