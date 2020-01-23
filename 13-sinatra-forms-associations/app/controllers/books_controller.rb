class BooksController < ApplicationController

    get '/books' do
        @books = Book.all
        erb :'books/index.html'
    end

    post '/books' do
        # going to get you started with params hashes- look how we're using hashes here
        book = Book.new(title: params['book']['title'], snippet: params['book']['snippet'])
        # how do I augment to answer part 2 of the last user story? need to add author_id in some way.

        book.save

        # need to redirect to our new book for good user experience(ux)
        redirect '/books/#{books.id}'
       
    end

    get '/books/new' do
        # what can I do here to see all authors for dropdown? 
        erb :"books/new"
    end

    get '/books/:id' do
        @book = Book.find(params[:id])

        erb :'books/show.html'
    end

end