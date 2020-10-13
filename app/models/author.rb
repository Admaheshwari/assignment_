# == Schema Information
#
# Table name: authors
#
#  id            :bigint           not null, primary key
#  first_name    :string
#  last_name     :string
#  date_of_birth :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Author < ApplicationRecord

	has_and_belongs_to_many :books, dependent: :destroy

	validates :first_name, :last_name, :date_of_birth, presence: true

	before_destroy :delete_books

	private

	def delete_books
		if self.books.present?
			book_ids = self.books.pluck(:id) 
			Book.where(id: book_ids).destroy_all
		end
	end

end
