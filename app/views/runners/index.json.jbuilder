json.array!(@runners) do |runner|
  json.extract! runner, :firstname, :lastname
  json.url runner_url(runner, format: :json)
end
