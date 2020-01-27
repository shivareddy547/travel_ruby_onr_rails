require 'net/http'
require 'json'
require 'rapid_api/version'
require 'rapid_api/config'
require 'uri'
require 'net/http'
require 'openssl'

module RapidAPI
  class << self
    def config(**args)
      RapidAPI::Config.setup(args)
    end

    def call(package_name, block_name, args={})
      # Create URI
      uri = build_uri(package_name, block_name)

      req = build_request(uri, args)

      # Execute
      # res = Net::HTTP.start(uri.hostname, uri.port) { |http|
      #   http.request(req)
      # }
    #   p req
    #   http = Net::HTTP.new(uri.host, uri.port)
    #   http.use_ssl = true
    #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #   res = http.start do |http|
    #    http.request(req)
    # end

        http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

p "===================================start======================="



# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-host"] = 'tripadvisor1.p.rapidapi.com'
# request["x-rapidapi-key"] = '8776172ce1mshace0560ee5f4fc4p11f23cjsn9d6963618abe'

# response = http.request(req)
res = http.request(req)
# puts response.read_body

      # Jsonify
      reply = JSON.parse(res.body)

      # Check for request errors
      unless res.code.to_i == 200
        reply['outcome'] = 'error'
        reply['payload'] = 'Networking error'
      end

      # Return result
      reply
    end

    def build_uri(package, block)
     # p URI("https://tripadvisor1.p.rapidapi.com/#{package}/#{block}")
  URI("https://tripadvisor1.p.rapidapi.com/#{package}#{block}")
   # URI("https://tripadvisor1.p.rapidapi.com/#{package}/#{block}?limit=10&question_id=5283833")
    end

    def build_request(uri, form_data)



request = Net::HTTP::Get.new(uri)
request["x-rapidapi-host"] = 'tripadvisor1.p.rapidapi.com'
request["x-rapidapi-key"] = '8776172ce1mshace0560ee5f4fc4p11f23cjsn9d6963618abe'
#       config = RapidAPI::Config

#       # Create request
#       req = Net::HTTP::Get.new(uri)
#       req["Content-Type"] = 'application/json'
#       req["x-rapidapi-host"] = 'tripadvisor1.p.rapidapi.com'
# req["x-rapidapi-key"] = '8776172ce1mshace0560ee5f4fc4p11f23cjsn9d6963618abe'

#       # Set project credentials
#       p config.project
#       p config.api_key
#       req.basic_auth(config.project, config.api_key)
# # p req.basic_auth
# # p form_data
#       # Add arguments
#       req.set_form_data(form_data)

      request
    end
  end
end
