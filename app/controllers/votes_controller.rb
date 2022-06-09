class VotesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  def new
    @post = Post.find(params[:post_id])
    Vote.new do |v|
      v.post = @post
      v.upvote = params[:upvote]
      v.user = current_user
      prev_vote = find_previous_vote

      if prev_vote == [] && v.save
        redirect_to post_path(@post)
      elsif prev_vote.upvote != true?(params['upvote'])
        prev_vote.upvote = true?(params['upvote'])
        prev_vote.save
        redirect_to post_path(@post)
      else
        redirect_to post_url(@post), alert: "You may only vote on a post once."
      end
    end
  end

  def create
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

  def find_previous_vote
    post = Post.find(params["post_id"].to_i)
    vote = post.votes.where(user_id: current_user).map(&:attributes)
    if vote == []
      []
    else 
      Vote.find(vote[0]['id'])
    end
  end

  def true?(obj)
    obj.to_s.downcase == "true"
  end

  private
  def vote_params
    params.require(:vote).permit(:upvote, :post_id)
  end
end
