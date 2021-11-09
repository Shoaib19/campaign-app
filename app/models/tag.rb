class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :campaign_tab

  validates :name, :campaign_tab_id, :user_id ,:presence => {:message => "dont't leave blank "}
end
