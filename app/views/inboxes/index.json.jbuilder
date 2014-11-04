json.array!(@inboxes) do |inbox|
  json.extract! inbox, :id
  json.url inbox_url(inbox, format: :json)
end
