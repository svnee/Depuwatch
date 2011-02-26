class Deputy < ActiveRecord::Base
  belongs_to :party
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
  
  def presence
    t = Text.all.count
    p = 0
    votes.each { |v| p += v.delegate.nil? ? 1 : 0 }
    
    "%f" % ((p / t.to_f) * 100)
  end
end
