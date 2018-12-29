require 'interactor'

module DiscoApp
  module Flow
    class ProcessAction

      include Interactor

      delegate :action, :action_service_class, to: :context

      def call
        validate_action
        find_action_service_class
        execute_action_service_class
      end

      private

        def validate_action
          context.fail! unless action.pending?
        end

        def find_action_service_class
          context.action_service_class = begin
            # First try to find a top-level matching service class
            action.action_id.classify.constantize
          rescue NameError
            begin
              # If that fails, try a Flow::Actions prefix.
              %Q(Flow::Actions::#{("#{action.action_id}".classify)}).constantize
            rescue NameError
              update_action(false, ["Could not find service class for #{action.action_id}"])
              context.fail!
            end
          end
        end

        def execute_action_service_class
          result = action_service_class.call(shop: action.shop, properties: action.properties)
          update_action(result.success?, result.errors)
        end

        def update_action(success, errors)
          action.update!(
            status: success ? Action.statuses[:succeeded] : Action.statuses[:failed],
            processing_errors: success ? [] : errors,
            processed_at: Time.current
          )
        end

    end
  end
end
