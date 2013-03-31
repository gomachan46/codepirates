# coding: utf-8
require '../q3'
require 'pry'
describe "q3" do
  let(:score) {[[3,5],[10],[5,0],[3,1],[5,5],[9,0],[6,4],[0,0],[1,9],[10,10,0]]}
  before do
    @bowling = Bowling.new
  end
  describe "calcScore" do
    context "実行サンプルを投げた時" do
      it "110が返ってくる" do
        @bowling.calcScore(score).should == 110
      end
    end
    context "満点を投げた時" do
      score = [[10],[10],[10],[10],[10],[10],[10],[10],[10],[10,10,10]]
      it "300が返ってくる" do
        @bowling.calcScore(score).should == 300
      end
    end
    context "最終フレームがスペアだった時" do
      score = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[5,5,5]]
      it "15が返ってくる" do
        @bowling.calcScore(score).should == 15
      end
    end
    describe "ストライクの表記が[10,0]の場合でもちゃんと動作する" do
      score = [[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10,10]]
      it "300が返ってくる" do
        @bowling.calcScore(score).should == 300
      end
    end
  end
end
