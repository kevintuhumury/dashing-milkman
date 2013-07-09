require "milkman"

# milkman configuration

api_key       = "API_KEY"
shared_secret = "SHARED_SECRET"
auth_token    = "AUTH_TOKEN"

client        = Milkman::Client.new api_key: api_key, shared_secret: shared_secret, auth_token: auth_token

# widget configuration

filter        = 'status:incomplete AND (dueBefore:today OR dueWithin:"1 day of today")'
date_format   = "%d/%m/%y"
sort_by       = "date"
max_items     = 8

SCHEDULER.every "5m", first_in: 0 do |job|
  response = client.get "rtm.tasks.getList", filter: filter

  if response
    tasks = response["rsp"]["tasks"]["list"].each_with_object([]) do |list, items|
      [ list["taskseries"] ].flatten.each do |task|
        items << {
          name: task["name"],
          date: task["task"]["due"],
          priority: task["task"]["priority"],
          formatted_date: DateTime.parse(task["task"]["due"]).strftime(date_format)
        }
      end
    end.sort_by { |task| task[sort_by.to_sym] }

    send_event "milkman", { items: tasks.take(max_items) }
  end
end
