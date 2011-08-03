class Legislation < ActiveRecord::Base
  def deputies
    deputies = Array.new
    Deputy.all.each do |d|
      deputies << d if d.memberships.any? {|m| (m.start < self.end && m.end.nil?) || (m.start < self.end && m.end > self.start)}
    end
  end
end
