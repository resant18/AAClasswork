class PostsController < ApplicationController
    before_action :require_sign_in, except: [:index, :show]
    before_action :require_post_owner, only: [:edit, :update]

    def new
        @post = Post.new 
        render :new
    end

    def  create
        # set up the author id directly is not good, instead
        # put it in the whitelist params and used the current_user.post
        # @post = Post.new(post_params)   
        # @post.author_id = current_user.id  
        
        @post = current_user.posts.new(post_params)

        if @post.save
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash[:erros] = @post.errors.full_messages
            render :edit 
        end 
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
    end

    def require_post_owner
        return if current_user.posts.find(params[:id])
        render json: 'Forbidden', status: :forbidden
    end
end
