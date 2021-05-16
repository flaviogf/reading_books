require "test_helper"

class BookTest < ActiveSupport::TestCase
  test 'should save a book' do
    book = Book.new title: 'Clean Code', author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: 'to read'

    assert book.save
  end

  test 'should not save a book without title' do
    book = Book.new title: nil, author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: 'to read'

    assert_not book.save
  end

  test 'should not save a book without author' do
    book = Book.new title: 'Clean Code', author: nil, cover: 'https://via.placeholder.com/133x191', status: 'to read'

    assert_not book.save
  end

  test 'should not save a book without cover' do
    book = Book.new title: 'Clean Code', author: 'Robert C. Martin', cover: nil, status: 'to read'

    assert_not book.save
  end

  test 'should not save a book without status' do
    book = Book.new title: 'Clean Code', author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: nil

    assert_not book.save
  end

  test 'should not save a book with an invalid status' do
    book = Book.new title: 'Clean Code', author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: 'wrong'

    assert_not book.save
  end
end
