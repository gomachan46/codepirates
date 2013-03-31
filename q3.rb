class Bowling
  def calcScore score
    score_rev = score.reverse # ストライク,スペアの時のボーナスを計算したかったので配列を後ろから処理
    score_rev.each_with_index.inject(0){|total_score,(frame,index)|
      # 状況にあわせてトータルスコアを算出
      if index==0 then
        total_score += frame.inject(0){|sum,s|sum+=s}
      elsif frame.first==10 then
        total_score += score_rev[index-1].first+(score_rev[index-1].first==10 ? score_rev[index-2].first : score_rev[index-1].last)+frame.first
      elsif frame.first+frame.last==10 then
        total_score += score_rev[index-1].first+frame.first+frame.last
      else
        total_score += frame.inject(0){|sum,s|sum+=s}
      end
    }
  end
end
