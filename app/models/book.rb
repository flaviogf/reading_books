class Book < ApplicationRecord
  enum status: { to_read: 'to read', reading: 'reading', read: 'read' }

  validates :title, presence: true

  validates :author, presence: true

  validates :cover, presence: true

  validates :status, presence: true
end
