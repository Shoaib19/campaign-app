module TopicsHelper

    def get_user(topic)
        return true if topic.user_id == current_user.id
        return false
    end
    
    def get_comments(t)
        return t.comments.all
    end
end
