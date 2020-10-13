class Api::V1::AuthorSerializer < ActiveModel::Serializer

	has_many :books, serializer: Api::V1::BookSerializer

	attributes :id, :first_name, :last_name, :date_of_birth, :created_at, :updated_at

end