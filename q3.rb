class Bowling
  def calcScore score
    score_rev = score.reverse
    result = score_rev.each_with_index.inject(0){|total_score,(frame,index)|
      # 状況にあわせてトータルスコアを算出
      if index==0 then
        total_score += frame.inject(0){|sum,s|s.gsub!(/strike|spare/){10};sum+=s.to_i}
      elsif frame[0]==='strike' then
        frame[0].gsub!('strike'){10}
        total_score += score_rev[index-1][0].to_i+(score_rev[index-1][1].nil? ? score_rev[index-2][0] : score_rev[index-1][1]).to_i+frame[0].to_i
      elsif frame[1]==='spare' then
        frame[1].gsub!('spare'){10}
        total_score += score_rev[index-1][0].to_i+frame[1].to_i
      else
        total_score += frame.inject(0){|sum,s|sum+=s.to_i}
      end
    }
    result
  end
end
