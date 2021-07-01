require 'dotenv/load'
require 'faraday'
require 'pry'
require 'NoSortParamsEncoder'

module AccountsHelper
  def connect_to_binance(account)
    apiEndPoint = ENV['BINANCE_END_POINT']
    if apiEndPoint.nil? || apiEndPoint.empty?
      return false
    end

    if account.exchange_market == "Binance"
      api_key = account.api_key
      secret_key = account.secret_key

      signed_timestamp = (Time.now.to_f * 1000).to_i.to_s
      query_string = "type=SPOT&timestamp=#{signed_timestamp}"
      digest = OpenSSL::Digest::SHA256.new
      signature = OpenSSL::HMAC.hexdigest(digest, secret_key, query_string)

      api_url = "#{apiEndPoint}/sapi/v1/accountSnapshot"
      conn = Faraday.new(
        url: api_url,
        params: {type: "SPOT", timestamp: signed_timestamp, signature: signature},
        headers: {'X-MBX-APIKEY' => api_key},
        request: { params_encoder: NoSortParamsEncoder::NoSortEncoder} #using custom encoder without sorting the params (wrong signature)
      )

      response = conn.get()
      
      if response.status == 200
        body = JSON.parse(response.body)
        body["snapshotVos"][-1]["data"]["balances"] #get the list of holding coins from latest timestamp data
      else
        #TO-DO HANDLE ERROR CODE LATER
        []        
      end
    else
      #TO-DO
      []
    end
  end
end
