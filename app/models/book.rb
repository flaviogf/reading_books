class Book < ApplicationRecord
  enum status: [:to_read, :reading, :read]

  validates :title, presence: true

  validates :author, presence: true

  validates :cover, presence: true

  validates :status, presence: true
end
