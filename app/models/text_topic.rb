class TextTopic < ActiveRecord::Base
  belongs_to :text
  belongs_to :topic
end
