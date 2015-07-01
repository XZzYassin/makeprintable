module MakePrintable
  class Client
    def base_uri(path='/')
      "https://api.makeprintable.com/v1#{path}"
    end

    def configure_payload(path, opts={})
      base_uri(path) + opts.to_params
    end

    def get_request(uri)
      Crack::XML.parse RestClient::Request.execute(method: :get, url: uri, headers: {key: self.api_key})
    end

    def post_request(path, opts)
      Crack::XML.parse RestClient.post(base_uri(path), opts, key: self.api_key)
    end

    def delete_request(uri)
      Crack::XML.parse RestClient::Request.execute(method: :delete, url: uri, headers: {key: self.api_key})
    end
  end
end
