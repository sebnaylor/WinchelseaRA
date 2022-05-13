class VotesController < ApplicationController
    before_action :authenticate_user!, only: %i[new edit create update destroy]

    def new
        @post = Post.find(params[:post_id])
        vote = Vote.new do |v|
            v.post = @post
            v.upvote = params[:upvote]
            v.user = current_user
            if v.save 
                redirect_to post_path(@post)
            else
                redirect_to post_url(@post), alert: "You may only vote on a post once." 
            end
        end
    
    end

    def create
        @post = Post.find(params[:post_id])
        @vote = Vote.new(vote_params)
        @vote.post = @post
        if @vote.save
            redirect_to posts_path
          else
            render :new
          end
    end

    def update
    
    end

    def destroy
     
    end

    def up_vote
        @post = Post.find(params[:post_id])
        @vote = Vote.new(vote_params)
        @vote.post = @post
        if @vote.save
            redirect_to posts_path
          else
            render :new
          end
    end
    private
    def vote_params
        params.require(:vote).permit(:upvote, :post_id)
    end
end
