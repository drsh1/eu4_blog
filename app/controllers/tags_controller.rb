class TagsController < ApplicationController

    def show
        @tag = Tag.find(params[:id])
      end
    
    def index
        @tags = Tag.all
    end  

    
    # can't get this to work
    def destroy
        @tag = Tag.find(params[:id])

        @tag.destroy

        flash.notice = "Tag '#{@tag.title}' deleted!"

        redirect_to tags_path # go to tags index page
    end

end
