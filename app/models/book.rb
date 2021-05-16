class Book < ApplicationRecord
  BOOK_STATUSES = ['to read', 'reading', 'read']

  validates :title, presence: true

  validates :author, presence: true

  validates :cover, presence: true

  validates :status, presence: true, inclusion: { in: BOOK_STATUSES }
end
