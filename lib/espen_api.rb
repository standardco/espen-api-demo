class EspenApi
  def initialize
    @@espen_api_url = "#{ENV['ESPEN_ENDPOINT']}/api"
    @@api_key = ENV['ESPEN_API_KEY']
  end

  def get_country_list
    response = Faraday.new.get do |req|
      req.headers['Content-Type'] = 'application/json'
      req.url "#{@@espen_api_url}/cartographies?admin_level=admin0&attributes=admin0,iso2&api_key=#{@@api_key}"
    end

    return JSON.parse(response.body)
  end

  def get_jap_data(country,year)
    response = Faraday.new.get do |req|
      req.headers['Content-Type'] = 'application/json'
      req.url "#{@@espen_api_url}/japs/#{country}-#{year}?api_key=#{@@api_key}"
    end

    return {status: response.status, body: JSON.parse(response.body)}
  end

end
