module ErrorHandler
      extend ActiveSupport::Concern

      included do
         rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      end

      private

      def record_not_found
          puts "######...record_not_found called()"
          logger.error "Active record not found, id: #{params[:id]}"
          render partial: "/layouts/partials/errors/404", status: :not_found
      end
end
