require 'net/http'
require 'json'

uri = URI("http://localhost:6800/jsonrpc")
stack = ENV['WPM-STACK'] || ARGV[0]
arg = `redis-cli --raw lpop #{stack}`
name = `redis-cli --raw lpop #{stack}`
Net::HTTP.start(uri.host, uri.port) do |http|
    request = Net::HTTP::Post.new uri
    request.content_type = 'application/json'
    request.body = JSON.dump(
        {"jsonrpc":"2.0",
         "method": JSON.parse(name),
         "id":1,
         "params": JSON.parse(arg)
         }
    )
    response = http.request request # Net::HTTPResponse object
    r = JSON.parse(response.body)
    system %{redis-cli --raw lpush #{stack} #{r["result"]}}
end