class Api::V1::BookSerializer < ActiveModel::Serializer

	attributes :id, :book_title, :created_at, :updated_at
	
end