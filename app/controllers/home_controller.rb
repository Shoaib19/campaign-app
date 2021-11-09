class HomeController < ApplicationController
  def index
    @campaign_tabs = CampaignTab.all
  end
end
