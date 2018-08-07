class Api::V1::ScoresController < ApplicationController

  def version
#    render json: { "version" => "1.1", "notes" => "Leaderboard reset with new features:#New unlockable jumps and eggs along with a jump leaderboard!#Names for top scores/totals/streaks#More bug squashing" }
    render json: { "version" => "1.04", "notes" => "'S' to skip countdown,#score font updated,#many bugfixes & visuals/website upgrades" }
  end

  def index
    @scores = Score.all
    render json: @scores
  end

  def unique
    @scores = Score.order(:total).reverse.uniq { |x| x[:username] }.order(:id)
    render json: @scores
  end

  def mdev
    @scores = Score.all
    n_ip = @scores.attribute_names.delete_if { |x| x['ddiamond_points']}
    render json: @scores.select(n_ip)
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
    @score = Score.order(:total).reverse.uniq { |x| x[:username] }[0...10]
    render json: @score
  end

  def top_jumps_with_names
    # array of hashes
    @array = [
      'gate', 'diagonal', 'fjump', 'sgate', 'platform',
      'cascade', 'tbone', 'mjump2', 'shuriken', 'hdiamond',
      'mjump1', 'diamond', 'bubble', 'vortex', 'hourglass',
      'plane', 'corner', 'valve', 'ninejump', 'ddiamond'
      ];

      @jump_types = [];

      @array.each do |jump|
        ['_jumps', '_streak', '_points'].each do |type|
          @jump_types << jump + type;
        end
      end

      @scores = {};

      @jump_types.each do |type|
        @scores[type] = { 'username' => '', 'multi' => {}, 'id' => '', 'number' => 0 };
      end

      Score.all.each do |score|
        @jump_types.each do |type|
          if (score[type.to_sym].round(2) > @scores[type]['number']) then
            @scores[type]['number'] = score[type.to_sym].round(2);
            @scores[type]['username'] = score[:'username'];
            @scores[type]['multi'] = {};
            @scores[type]['multi'][score[:'username']] = [score[:'id']];
            @scores[type]['id'] = score[:'id'];
          elsif (score[type.to_sym].round(2) == @scores[type]['number']) then
            if (@scores[type]['multi'][score[:'username']]) then
              @scores[type]['multi'][score[:'username']] << score[:'id'];
            else
              @scores[type]['multi'][score[:'username']] = [score[:'id']];
              @scores[type]['username'] = 'Multiple People';
              @scores[type]['id'] = '';
            end
          end
        end
      end

    render json: @scores
  end

  def top_jumps_each
    # array of hashes
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
    @scores = [];
    @jumps = {};
    @array.each_with_index do |jump, i|
      n = 5
      run = Score.order(jump).reverse.first(n)
      username = run[0]['username']
      score = run[0][jump]
      score = (score*100).round/100.0 if score.class == Float

      i = 1
      while i < n
        score_compare = run[i][jump]
        score_compare = (score_compare*100).round/100.0 if score_compare.class == Float
        if score != score_compare then
          i = n
        elsif username == run[i]['username'] then
          username = 'Multiple People'
          i = n
        else
          i += 1
        end
      end

      if i % 3 == 0
        @jumps = {}
        @jumps["jumps"] = score
        @jumps['jumps_username'] = username
      elsif i % 3 == 1
        @jumps["streak"] = score
        @jumps['streak_username'] = username
      elsif i % 3 == 2
        @jumps["points"] = score
        @jumps['points_username'] = username
        @scores << @jumps
      end
    end

    render json: @scores
  end

  def top_jumps_nums
    # just gives the numerical values
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
    @scores = []
    @array.each do |jump, i|
      score = Score.order(jump).reverse.first[jump]
      score = (score*100).round/100.0 if score.class == Float
      @scores << score
    end
    render json: @scores
  end

  def top_jumps
    # one big hash
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
    @scores = {}
    @array.each do |jump|
      score = Score.order(jump).reverse.first[jump]
      score = (score*100).round/100.0 if score.class == Float
      @scores[jump] = score
    end
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
    :ipa,

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
