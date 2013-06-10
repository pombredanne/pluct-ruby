require 'rest_client'

module Pluct
  module Helpers
    module Request
      DEFAULT_HEADERS = {
        'content-type' => 'application/json'
      }

      protected
      def get(url, *opts)
        options = Hash[*opts]
        resource = RestClient::Resource.new(url)
        resource.get(DEFAULT_HEADERS.merge(options))
      rescue RestClient::Exception => e
        raise_exception(e)
      end

      def head(url, *opts)
        options = Hash[*opts]
        resource = RestClient::Resource.new(url)
        resource.head(DEFAULT_HEADERS.merge(options))
      rescue RestClient::Exception => e
        raise_exception(e)
      end

      def delete(url, *opts)
        options = Hash[*opts]
        resource = RestClient::Resource.new(url)
        resource.delete(DEFAULT_HEADERS.merge(options))
      rescue RestClient::Exception => e
        raise_exception(e)
      end

      def post(url, *opts)
        data, options = *opts
        options = Hash[*opts] if options
        resource = RestClient::Resource.new(url)
        resource.post(data, DEFAULT_HEADERS.merge(options))
      rescue RestClient::Exception => e
        raise_exception(e)
      end

      def put(url, *opts)
        data, options = *opts
        options = Hash[*opts] if options
        resource = RestClient::Resource.new(url)
        resource.put(data, DEFAULT_HEADERS.merge(options))
      rescue RestClient::Exception => e
        raise_exception(e)
      end

      def patch(url, *opts)
        data, options = *opts
        options = Hash[*opts] if options
        resource = RestClient::Resource.new(url)
        resource.patch(data, DEFAULT_HEADERS.merge(options))
      rescue RestClient::Exception => e
        raise_exception(e)
      end

      private
      def raise_exception(exception)
        case exception.http_code
          when 401
             raise Pluct::Errors::Unauthorized, {http_code: 401, error_description: exception.http_body} 
          when 404
             raise Pluct::Errors::UrlNotFound, {http_code: 404, error_description: exception.http_body} 
        end
      end
    end
  end
end
