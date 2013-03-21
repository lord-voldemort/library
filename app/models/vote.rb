class Vote < ActiveRecord::Base
  attr_accessible :topic_link_id, :user_id

  belongs_to :user
  belongs_to :topic_link
  
end
