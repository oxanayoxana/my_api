# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }

  # def can_modify?(user_id)
  #   role == 'admin' || id.to_s == user_id.to_s
  # end

  # def is_admin?
  #   role == 'admin'
  # end
end
