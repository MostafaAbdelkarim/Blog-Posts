class PostsController < ApplicationController
    def index #defining index as a controller to be refered to (root)
        @post = Post.all
    end

    def new #defining new as as resource in routes file
        @post = Post.new
    end

    def show #displaying post by id
        @post = Post.find(params[:id])
    end

    def create #Method for saving in DB using Model(Post)
        @post = Post.new(post_params) #assiging new post to Post Model to be saved in DB

        if(@post.save)
            redirect_to @post
        else
            render "new"
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update #update method for updating post by id
        @post = Post.find(params[:id])
        if(@post.update(post_params))
            redirect_to @post
        else
            render "edit"
        end
    end

    def destroy #delete method taking post id and redirecting all posts page
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path
    end

    private def post_params #defining what post consists of to save to db
        params.require(:post).permit(:title, :body) 
    end
end
