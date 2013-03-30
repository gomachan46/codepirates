# coding: utf-8
require '../q3'
require 'pry'
describe "q3" do
  let(:score) {[[3,5],['strike'],[5,'-'],[3,1],[5,'spare'],[9,'-'],[6,'spare'],['G','-'],[1,'spare'],['strike','strike','G']]}
  before do
    @bowring = Bowring.new
  end
  describe "newした時" do
    it "scoreは0点" do
      @bowring.score.should == 0
    end
  end
  describe "calcScore" do
    context "実行サンプルを投げた時" do
      it "110が返ってくる" do
        @bowring.calcScore(score).should == 110
      end
    end
    context "満点を投げた時" do
      score = [['strike'],['strike'],['strike'],['strike'],['strike'],['strike'],['strike'],['strike'],['strike'],['strike','strike','strike']]
      it "300が返ってくる" do
        @bowring.calcScore(score).should == 300
      end
    end
  end
end
