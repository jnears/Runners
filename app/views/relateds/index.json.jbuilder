json.array!(@relateds) do |related|
  json.extract! related, :weburl
  json.url related_url(related, format: :json)
end
