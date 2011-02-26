class Topic < ActiveRecord::Base
  has_many :text_topics
  has_many :texts, :through => :text_topics
end
