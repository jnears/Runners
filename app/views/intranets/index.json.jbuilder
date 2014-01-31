json.array!(@intranets) do |intranet|
  json.extract! intranet, :category_name, :show
  json.url intranet_url(intranet, format: :json)
end
