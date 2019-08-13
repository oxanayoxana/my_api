class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, :title, :content, presence: true
end
