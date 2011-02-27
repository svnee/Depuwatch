class Text < ActiveRecord::Base
  has_many :votes
  belongs_to :seance
  has_many :text_topics
  has_many :topics, :through => :text_topics
  
  def votes_pour
    res = []
    votes.each do |v|
      res << v if v.vote == 1
    end
    
    res
  end
  
  def votes_contre
    res = []
    votes.each do |v|
      res << v if v.vote == -1
    end
    
    res
  end
  
  def abstentions
    res = []
    votes.each do |v|
      res << v if v.vote == 0
    end
    
    res
  end
  
  def topics_to_str
    str = ""
    topics.each do |t| 
      str += "<a href='/topics/#{t.id}'>#{t.name}</a>"
    end
    
    str
  end
  
  def party_opinion(pid)
    c, p, a = 0,0,0
    votes.each do |v|
      if v.deputy.party.id == pid then
        if v.vote == -1 then
          c += 1
        elsif v.vote == 1 then
          p += 1
        else
          a += 1
        end
      end
    end
    
    if c > p then
      if c > a then
        -1
      else
        0
      end
    else
      if a > p then
        0
      else
        1
      end
    end
    
  end
  
end
