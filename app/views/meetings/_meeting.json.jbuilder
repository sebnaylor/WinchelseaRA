# <%Converted - not tested %>
json.extract! meeting, :id, :date, :time, :venue, :agenda, :minutes, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
