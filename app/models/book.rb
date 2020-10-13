# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  book_title :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Book < ApplicationRecord

	has_and_belongs_to_many :authors, dependent: :destroy

	validates :book_title, presence: true
	validates_presence_of :author_ids


end
