class BooksController < ApplicationController

    get '/books' do
        @books = Book.all
        erb :'books/index.html'
    end

    post '/books' do
        Book.new(title:)
    end

    get '/books/new' do
        erb :"books/new"
    end

end