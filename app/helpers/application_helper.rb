module ApplicationHelper
    def copy_right_date
        Time.now.strftime("%Y")
    end

    def format_date_to_localtime(datetime)
        datetime.localtime.strftime("%B %d, %Y %I:%M %p")
    end
end
