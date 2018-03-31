require 'net/http'
require 'json'

uri = URI("http://localhost:6800/jsonrpc")

Net::HTTP.start(uri.host, uri.port) do |http|
    request = Net::HTTP::Post.new uri
    request.content_type = 'application/json'
    request.body = JSON.dump(
        [{"jsonrpc":"2.0",
         "method":"aria2.shutdown",
         "id":1,
         }]
    )
    response = http.request request # Net::HTTPResponse object
    puts response
end