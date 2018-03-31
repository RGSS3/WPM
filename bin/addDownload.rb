require 'net/http'
require 'json'

uri = URI("http://localhost:6800/jsonrpc")
stack = ENV['WPM-STACK'] || ARGV[0]
Net::HTTP.start(uri.host, uri.port) do |http|
    request = Net::HTTP::Post.new uri
    request.content_type = 'application/json'
    request.body = JSON.dump(
        {"jsonrpc":"2.0",
         "method":"aria2.addUri",
         "id":1,
         "params":[[`redis-cli --raw lpop #{stack}`],{"split":"5","max-connection-per-server":"1","seed-ratio":"1.0"}]
         }
    )
    response = http.request request # Net::HTTPResponse object
    r = JSON.parse(response.body)
    system %{redis-cli --raw lpush #{stack} #{r["result"]}}
end