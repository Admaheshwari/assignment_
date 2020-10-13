module Api::V1
	class ApiController < ApplicationController

		include RenderingMethods

		rescue_from ActiveRecord::RecordNotFound, with: :not_found


		def not_found(exception)
			render_unprocessable_entity("#{exception.model.constantize} record not found", 404)
		end

	end
end
