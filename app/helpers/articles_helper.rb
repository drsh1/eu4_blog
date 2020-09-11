module ArticlesHelper

    # declare method for NEW article
    def article_params
        params.require(:article).permit(:title, :body, :tag_list)
    end

      
end
