require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get books_url

    assert_response :success
  end

  test 'should get new' do
    get new_book_url

    assert_response :success
  end

  test 'should create book' do
    request_parameters = { book: { title: 'Clean Architecture', author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: 'to_read' } }

    post books_url, params: request_parameters

    assert_equal 4, Book.count
  end

  test 'should redirect when book was created' do
    request_parameters = { book: { title: 'Clean Architecture', author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: 'to_read' } }

    post books_url, params: request_parameters

    assert_redirected_to book_path(Book.last)
  end

  test 'should rerender when book was not created' do
    request_parameters = { book: { title: nil, author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: 'to_read' } }

    post books_url, params: request_parameters

    assert_response :unprocessable_entity
  end

  test 'should show book' do
    book = books(:clean_code)

    get book_path(book)

    assert_response :success
  end

  test 'should get edit' do
    book = books(:clean_code)

    get edit_book_path(book)

    assert_response :success
  end

  test 'should update book' do
    book = books(:clean_code)

    request_parameters = { book: { title: 'Clean Architecture', author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: 'to_read' } }

    put book_path(book), params: request_parameters

    assert_redirected_to book_path(book)
  end

  test 'should redirect when book was updated' do
    book = books(:clean_code)

    request_parameters = { book: { title: 'Clean Architecture', author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: 'to_read' } }

    put book_path(book), params: request_parameters

    assert_redirected_to book_path(book)
  end

  test 'should rerender when book was not updated' do
    book = books(:clean_code)

    request_parameters = { book: { title: nil, author: 'Robert C. Martin', cover: 'https://via.placeholder.com/133x191', status: 'to_read' } }

    put book_path(book), params: request_parameters

    assert_response :unprocessable_entity
  end

  test 'should destroy book' do
    book = books(:clean_code)

    delete book_path(book)

    assert_equal 2, Book.count
  end

  test 'should redirect to books url when destroy a book' do
    book = books(:clean_code)

    delete book_path(book)

    assert_redirected_to books_url
  end
end
