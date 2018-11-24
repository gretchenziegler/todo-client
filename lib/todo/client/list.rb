module Todo
  module Client
    class List
      include Configuration

      def initialize(params)
        @params = params
      end

      def self.find(params)
        new(params).show
      end

      def self.update(params)
        new(params).update
      end

      def self.delete(params)
        new(params).delete
      end

      def show
        raise UpstreamError, "Request to #{list_uri} unsuccessful" unless get_list.success?
        get_list.parsed_response 
      end

      def update
        HTTParty.patch(
          list_uri,
          body: list_content,
          headers: headers
        )
      end

      def delete
        HTTParty.get(
          list_uri,
          headers: headers
        )
      end

      private

      attr_reader :params

      def get_list
        @get_list ||= \
          HTTParty.get(
            list_uri,
            headers: headers
          )
      end

      def list_uri
        raise "Must specify list_id" unless params[:list_id]
        sprintf("%s/%s", BASE_URI, params[:list_id])
      end

    end
  end
end
