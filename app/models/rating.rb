class Rating < ActiveRecord::Base
  belongs_to :text, :class_name => "Text", :foreign_key => "text_id"
  
  named_scope :favs,   :conditions => [ "created_at > ?", DateTime.now - 7.days ]
end
