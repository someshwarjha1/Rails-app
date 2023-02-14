class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:show,:edit,:update,:destroy]
    def show
    end
    def index
        
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(set_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article saved successfully."
            redirect_to @article
        else 
            render 'new'
        end

    end

    def edit
        
    end

    def update

        
        if @article.update(set_params)
            flash[:notice] = "Edited Article successfully."
            redirect_to @article
        else 
            render 'edit'
        end
    end

    def destroy
        if @article.destroy
            redirect_to articles_path
        else
            flash[:alert] = "Not able to" 
            render 'index'
        end
    end

    private

    def set_params
        params.require(:article).permit(:title, :description)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end
