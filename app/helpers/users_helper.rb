module UsersHelper
    def check_user(usr)
        if usr.user_type == "novice" || usr.username == current_user.username
            return true
        end
    end
end
