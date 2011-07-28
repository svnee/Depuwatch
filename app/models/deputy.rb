class Deputy < ActiveRecord::Base
  belongs_to :party
  has_many :memberships
  has_many :votes
  
  def split_votes
    a, p, c = [], [], []
    votes.each do |v|
      if v.vote == 1 then
        p << v
      elsif v.vote == -1 then
        c << v
      else
        a << v
      end  
    end
    
    return p, c, a
  end
  
  def delegations
    d = []
    votes.each do |v|
      if !v.delegate.nil? then
        d << v
      end
    end
    
    d
  end
  
  def delegates
    d = []
    delegations.each do |v|
      d << v.delegate
    end
    
    d.uniq!
  end
  
  def texts_count
    texts = 0
    Text.all.each { |t| if (memberships.any? { |m| m.start < t.seance.start.to_date && (m.end.nil? || m.end > t.seance.end.to_date) }) then texts = texts + 1 end }
    texts
  end
  
  def presence
    texts = texts_count
    p = 0
    votes.each { |v| p += v.delegate.nil? ? 1 : 0 }
    
    "%f" % ((p / texts.to_f) * 100)
  end
  
  def delegations_rate
    "%f" % (delegations.count / votes.count.to_f)
  end
end
