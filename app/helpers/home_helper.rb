module HomeHelper
    def which_user(campaign_tab = 0)
        if campaign_tab != 0
         if campaign_tab.user_id == current_user.id
             return true
            end
        end
    end
end
