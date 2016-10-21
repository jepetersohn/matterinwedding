module Resizer

  def start_kraken
    @kraken ||= Kraken::API.new(
      :api_key => ENV['APIKEY'],
      :api_secret => ENV['APISECRET'])
  end

end


