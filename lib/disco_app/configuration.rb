module DiscoApp

  class Configuration

    # Required configuration.
    attr_accessor :app_name

    # Set the list of Shopify webhook topics to register.
    attr_accessor :webhook_topics

    # Define the list of fields to receive for each webhook topic.
    attr_accessor :webhook_fields

    # Set Flow configuration
    attr_accessor :flow_actions
    attr_accessor :flow_triggers

    # Set the below if using an application proxy.
    attr_accessor :app_proxy_prefix

    # Set the below if providing a carrier service endpoint.
    attr_accessor :carrier_service_callback_url

    # Set the below to create real Shopify charges.
    attr_accessor :real_charges
    alias real_charges? real_charges

    # Optional configuration, usually useful for development environments.
    attr_accessor :skip_proxy_verification
    alias skip_proxy_verification? skip_proxy_verification
    attr_accessor :skip_webhook_verification
    alias skip_webhook_verification? skip_webhook_verification
    attr_accessor :skip_carrier_request_verification
    alias skip_carrier_request_verification? skip_carrier_request_verification
    attr_accessor :skip_oauth
    alias skip_oauth? skip_oauth
    attr_accessor :disable_auto_login
    alias disable_auto_login? disable_auto_login

  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end

end
