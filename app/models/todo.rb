class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :campaign_tab

  validates :title, :campaign_tab_id, :user_id ,:presence => {:message => "dont't leave blank "}
end
