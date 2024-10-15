module ApplicationHelper
    def copy_right_date
        Time.now.strftime("%Y")
    end
end
