module DiscoApp
  module  Concerns
    module  ShopRedactJob

      extend ActiveSupport::Concern

      def perform(_shop, redaction_request)
        # See https://shopify.dev/tutorials/add-gdpr-webhooks-to-your-app#shop-redact
      end

    end
  end
end
