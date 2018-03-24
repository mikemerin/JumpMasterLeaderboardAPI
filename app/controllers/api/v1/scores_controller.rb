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

  def top
    @score = Score.order(:total).reverse[0]
    render json: @score
  end

  def top_three
    @scores = Score.order(:total).reverse[0...3]
    render json: @scores
  end

  def top_ten
    @score = Score.order(:total).reverse[0...10]
    render json: @score
  end

  def top_jumps
    @array = [
      'gate_jumps','gate_streak','gate_points',
      'diagonal_jumps','diagonal_streak','diagonal_points',
      'fjump_jumps','fjump_streak','fjump_points',
      'sgate_jumps','sgate_streak','sgate_points',
      'platform_jumps','platform_streak','platform_points',
      'cascade_jumps','cascade_streak','cascade_points',
      'tbone_jumps','tbone_streak','tbone_points',
      'mjump2_jumps','mjump2_streak','mjump2_points',
      'shuriken_jumps','shuriken_streak','shuriken_points',
      'hdiamond_jumps','hdiamond_streak','hdiamond_points',
      'mjump1_jumps','mjump1_streak','mjump1_points',
      'diamond_jumps','diamond_streak','diamond_points',
      'bubble_jumps','bubble_streak','bubble_points',
      'vortex_jumps','vortex_streak','vortex_points',
      'hourglass_jumps','hourglass_streak','hourglass_points',
      'plane_jumps','plane_streak','plane_points',
      'corner_jumps','corner_streak','corner_points',
      'valve_jumps','valve_streak','valve_points',
      'ninejump_jumps','ninejump_streak','ninejump_points',
      'ddiamond_jumps','ddiamond_streak','ddiamond_points' ]
    @scores = @array.map { |jump| {jump => Score.order(jump).reverse.first[jump] } }
    render json: @scores
  end

  def show
    @score = Score.find(params[:id])
    render json: @score
  end


  private

  def score_params
    params.require(:score).permit(
    :username,

    :total,
    :jumps,
    :deaths,
    :longest_streak,
    :bestjump_type,
    :bestjump_points,

    :easy_points,
    :easy_jumps,
    :gate_jumps,
    :gate_streak,
    :gate_points,
    :diagonal_jumps,
    :diagonal_streak,
    :diagonal_points,
    :fjump_jumps,
    :fjump_streak,
    :fjump_points,
    :sgate_jumps,
    :sgate_streak,
    :sgate_points,
    :platform_jumps,
    :platform_streak,
    :platform_points,

    :medium_points,
    :medium_jumps,
    :cascade_jumps,
    :cascade_streak,
    :cascade_points,
    :tbone_jumps,
    :tbone_streak,
    :tbone_points,
    :mjump2_jumps,
    :mjump2_streak,
    :mjump2_points,
    :shuriken_jumps,
    :shuriken_streak,
    :shuriken_points,
    :hdiamond_jumps,
    :hdiamond_streak,
    :hdiamond_points,

    :hard_points,
    :hard_jumps,
    :mjump1_jumps,
    :mjump1_streak,
    :mjump1_points,
    :diamond_jumps,
    :diamond_streak,
    :diamond_points,
    :bubble_jumps,
    :bubble_streak,
    :bubble_points,
    :vortex_jumps,
    :vortex_streak,
    :vortex_points,
    :hourglass_jumps,
    :hourglass_streak,
    :hourglass_points,

    :hardest_points,
    :hardest_jumps,
    :plane_jumps,
    :plane_streak,
    :plane_points,
    :corner_jumps,
    :corner_streak,
    :corner_points,
    :valve_jumps,
    :valve_streak,
    :valve_points,
    :ninejump_jumps,
    :ninejump_streak,
    :ninejump_points,
    :ddiamond_jumps,
    :ddiamond_streak,
    :ddiamond_points
    )
  end

end
