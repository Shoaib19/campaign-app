module ApplicationHelper
    def get_user_type
        if current_user.user_type == "expert" 
            return true
        else
            return false
        end
    end
end
