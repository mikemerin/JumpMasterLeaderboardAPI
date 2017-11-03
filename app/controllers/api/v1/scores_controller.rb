class Api::V1::ScoresController < ApplicationController

  def index
    @scores = Score.all
    render json: @scores
  end

  def create
    @score = Score.new(score_params)
    if @score.save
      render json: @score
    end
  end

  def show
    @score = Score.find(params[:id])
    render json: @score
  end

  private

  def score_params
    params.require(:score).permit(:username, :points, :easy, :medium, :hard, :hardest, :jmps, :deaths)
  end

end
