# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  status                 :string
#  user_role              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable


  validates :status, presence: true, inclusion: { in: %w(active inactive) }
  validates :user_role, presence: true, inclusion: { in: %w(admin user) }

  after_initialize :set_status

  private

  def set_status
  	self.status = "active" if self.status.nil?
  end

  
end
