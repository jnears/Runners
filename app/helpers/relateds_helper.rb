module RelatedsHelper
  require 'open-uri'
  require 'net/https'
 

def remote_file_exists?(url)
url = URI.parse(url)
http = Net::HTTP.new(url.host, url.port)
if url.include?('https') 
http.use_ssl = true
end
return http.head(url.request_uri).code == "200"


end
end
