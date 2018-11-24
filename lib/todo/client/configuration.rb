module Todo
  module Client
    module Configuration

      BASE_URI = 'http://todoable.teachable.tech/api/lists'

      def headers
        raise "Authorization token required" unless params[:token]
        { 'Authorization' => "Token token=\"#{params[:token]}\"" }
      end

      def list_content
        { list: content }.to_json
      end

      def content
        raise "Must specify name" unless params[:name]
        { name: params[:name] }
      end

    end
  end
end
