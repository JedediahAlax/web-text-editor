class Document < ApplicationRecord

  # association to user model
  belongs_to :user

  # this method is used to pull docs out of db in reverse order
  default_scope -> { order(created_at: :desc) }


  validates :user_id, presence: true
  validates :content, presence: true
end
