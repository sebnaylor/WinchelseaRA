class VotesController < ApplicationController
    def new
        @vote = Vote.new
    end

    def create
        @post = Post.find(params[:post_id])
        @vote = Vote.new(vote_params)
        @vote.post = @post
        raise
    end

    def update
    
    end

    def destroy
     
    end

    private
    def vote_params
        params.require(:vote).permit(:upvote, :post_id)
    end
end
