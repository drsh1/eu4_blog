class ArticlesController < ApplicationController
    include ArticlesHelper
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

    
    # method index (default webpage) -> list all articles
    def index
        @articles = Article.all
    end
      
    
    # method show -> show a single article  
    def show
        @article = Article.find(params[:id])  # find article in database by id = ..

        # this section to handle comments
        @comment = Comment.new  # create new COMMENT so rails can figure out which fields COMMENT has
        @comment.article_id = @article.id

    end


    # method new -> create a new ARTICLE object so rails can figure out which fields ARTICLE has
    def new
        @article = Article.new
  
    end

    # method create -> 2nd part of creating new article
    def create
    #    @article = Article.new
    #    @article.title = params[:article][:title]  # pull title from the request and insert into article object
    #    @article.body = params[:article][:body]    # pull body from the request and insert into article object
        
        @article = Article.new(article_params)
        
        @article.save

        flash.notice = "Article '#{@article.title}' created!"
        redirect_to article_path(@article)
    end
    

    # method destroy
    def destroy 
        @article = Article.find(params[:id])

        @article.destroy

        flash.notice = "Article '#{@article.title}' deleted!"

        redirect_to articles_path # go to index page
    end
      

    def edit
        @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
      @article.update(article_params)
      
      flash.notice = "Article '#{@article.title}' updated!"

      redirect_to article_path(@article)
    end
    

end
