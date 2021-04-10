class ArticlesController < ApplicationController
    before_action :initialize_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]


    def show
        
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 8)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(articles_params)
        @article.user = current_user
        if @article.save
            flash[:notice] = "Article was created successfully"
            redirect_to article_path(@article)         
        else
            render "new"
        end
    end

    def update
        if @article.update(articles_params)
            flash[:notice] = "Article was updated successfully"
            redirect_to @article        
        else
            render "edit"
        end    
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def initialize_article
        @article = Article.find(params[:id])
    end

    def articles_params
        params.require(:article).permit(:title, :description)
    end

    def require_same_user
        if !current_user == @article.user
            flash[:notice] = "You can only edit or delete your own articles"
            redirect_to @article
        end
    end

end