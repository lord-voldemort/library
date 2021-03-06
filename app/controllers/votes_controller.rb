class VotesController < ApplicationController
  def create
    @topic_link = TopicLink.find(params[:link_id])
    @topic = @topic_link.topic
    submitted_vote_status = params[:vote][:status].to_i
    @prior_vote = Vote.find_prior_vote(params[:vote][:user_id], params[:link_id])

    if @prior_vote && @prior_vote.same_as_submitted_vote?(submitted_vote_status)
      notice = "You have already #{@prior_vote.vote_kind} voted on this link."
    else
      @topic_link.cast_vote(@prior_vote, params[:vote], submitted_vote_status)
      notice = "Vote successful."
    end
    @topic.save
    respond_to do |format|
      format.html { redirect_to @topic, notice: notice}
      format.json { render json: @topic, status: :created, location: @topic }
    end
  end
end