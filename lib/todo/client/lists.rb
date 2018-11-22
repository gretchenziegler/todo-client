module Todo
  module Client
    module Lists
      include Configuration

      def initialize(params)
        @params = params
      end

      def self.all(params)
        new(params).index
      end

      def self.create(params)
        new(params).create
      end

      def index
        raise Error, "Request to #{BASE_URI} unsuccessful" unless get_lists.success?
        get_lists.parsed_response
      end

      def create
        # error or success message
      end

      private

      attr_reader :params

      def get_lists
        @get_lists ||= \
          HTTParty.get(
            BASE_URI,
            headers: headers
          )
      end

      def create_list
        HTTParty.post(
          BASE_URI,
          body: list_content,
          headers: headers
        ) 
      end

    end
  end
end
