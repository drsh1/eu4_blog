class ArticlesController < ApplicationController

    
    # method index (default webpage) -> list all articles
    def index
        @articles = Article.all
      end
      
    
    # method show -> show a single article  
    def show
        @article = Article.find(params[:id])  # find article in database by id = ..

    end


    # method new -> show a single article
    def new
      
    end
    
end
