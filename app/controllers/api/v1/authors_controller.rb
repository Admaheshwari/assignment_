module Api::V1
	class AuthorsController < ApiController

		before_action :check_author_record, only: [:show]

		def show
			render_success_response({
				author_details: single_serializer(@author, AuthorSerializer)
			}, "Author details")
		end

		private

		def check_author_record
			@author = Author.find(params[:id])
		end

	end
end
