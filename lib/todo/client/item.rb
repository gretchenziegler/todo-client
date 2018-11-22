module Todo
  module Client
    class Item
      include Configuration

      def initialize(params)
        @params = params
      end

      def self.create(params)
        new(params).create
      end

      def self.complete(params)
        new(params).complete
      end

      def self.delete(params)
        new(params).delete
      end

      def create
        # error or success message
      end

      def complete
        # error or success message
      end

      def delete
        # error or success message
      end

      private

      def create_item
        HTTParty.post(
          list_items_uri,
          body: item_content,
          headers: headers
        )
      end

      def complete_item
        HTTParty.put(
          complete_item_uri,
          headers: headers
        )
      end

      def delete_item
        HTTParty.delete(
          item_uri,
          headers: headers
        )
      end

      def item_content
        { item: content }.to_json
      end

      def complete_item_uri
        sprintf("%s/finish", item_uri)
      end

      def item_uri
        sprintf("%s/%s", list_items_uri, params[:item_id])
      end

      def list_items_uri
        sprintf("%s/%s/items", BASE_URI, params[:list_id])
      end

    end
  end
end
