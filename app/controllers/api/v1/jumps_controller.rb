class Api::V1::JumpsController < ApplicationController

  def index
    @jumps = Jump.all
    render json: @jumps
  end

  def create
    @jump = Jump.new(jump_params)
    if @jump.save
      render json: @jump
    end
  end

  def extra_jumps
    # array of hashes
    @array = [
      "16px", "rdiagonal", "cdiagonal", "rukito",
      "tas", "uvalve", "dvalve", "fang",
      "invert", "rcorner", "charlie", "superf",
      "dplane", "jdiamond", "cddiamond", "45",
      "boxcorner", "fspike", "bvalve", "tvalve", "dcascade", "?????", "minif", "dinvert", "ljump", "dbvalve", "ldiamond"
      ];

    @jump_types = [];

    @array.each do |jump|
      ['_jumps', '_streak', '_points'].each do |type|
        @jump_types << jump + type;
      end
    end

    @scores = {};

    @jump_types.each do |type|
      @scores[type] = { 'username' => '', 'multi' => {}, 'id' => '', 'number' => -1 };
    end

    Jump.all.each do |score|
      # p score
      # p "-----"
      ['jumps', 'streak', 'points'].each do |type|
        # p "type: "+type+", name: "+score[:jump_name]
        run_score = score[type.to_sym].round(2)
        score_name = score[:jump_name]+"_"+type
        top_score = @scores[score_name]['number']
        # p run_score.to_s + " > "+top_score.to_s
        if run_score > top_score then
          @scores[score_name]['number'] = run_score
          @scores[score_name]['username'] = score[:'username'];
          @scores[score_name]['multi'] = {};
          @scores[score_name]['multi'][score[:'username']] = [score[:'id']];
          @scores[score_name]['id'] = score[:'id'];
        elsif (run_score == top_score) then
          if (@scores[score_name]['multi'][score[:'username']]) then
            @scores[score_name]['multi'][score[:'username']] << score[:'id'];
          else
            @scores[score_name]['multi'][score[:'username']] = [score[:'id']];
            @scores[score_name]['username'] = 'Multiple People';
            @scores[score_name]['id'] = '';
          end
        end
      end
    end

    render json: @scores

  end

  def extra_jumps_each
    # array of hashes
    @array = [
      "16px", "rdiagonal", "cdiagonal", "rukito",
      "tas", "uvalve", "dvalve", "fang",
      "invert", "rcorner", "charlie", "superf",
      "dplane", "jdiamond", "cddiamond", "45",
      "boxcorner", "fspike", "bvalve", "tvalve", "dcascade", "?????", "minif", "dinvert", "ljump", "dbvalve", "ldiamond"
      ];

    @jump_types = [];

    @array.each do |jump|
      ['_jumps', '_streak', '_points'].each do |type|
        @jump_types << jump + type;
      end
    end

    @scores = {};

    @jump_types.each do |type|
      @scores[type] = { 'username' => '', 'multi' => {}, 'id' => '', 'number' => -1 };
    end

    Jump.all.each do |score|
      # p score
      # p "-----"
      ['jumps', 'streak', 'points'].each do |type|
        # p "type: "+type+", name: "+score[:jump_name]
        run_score = score[type.to_sym].round(2)
        score_name = score[:jump_name]+"_"+type
        top_score = @scores[score_name]['number']
        # p run_score.to_s + " > "+top_score.to_s
        if run_score > top_score then
          @scores[score_name]['number'] = run_score
          @scores[score_name]['username'] = score[:'username'];
          @scores[score_name]['multi'] = {};
          @scores[score_name]['multi'][score[:'username']] = [score[:'id']];
          @scores[score_name]['id'] = score[:'id'];
        elsif (run_score == top_score) then
          if (@scores[score_name]['multi'][score[:'username']]) then
            @scores[score_name]['multi'][score[:'username']] << score[:'id'];
          else
            @scores[score_name]['multi'][score[:'username']] = [score[:'id']];
            @scores[score_name]['username'] = 'Multiple People';
            @scores[score_name]['id'] = '';
          end
        end
      end
    end

    @scores_array = [];

    # @array.each do |jump|
    #   @info = {}
    #   jumps = @scores["#{jump}_jumps"]
    #   streak = @scores["#{jump}_streak"]
    #   points = @scores["#{jump}_points"]
    #   @info["jumps"] = jumps['number']
    #   @info["jumps_username"] = jumps['username']
    #   @info["streak"] = streak['number']
    #   @info["streak_username"] = streak['username']
    #   @info["points"] = points['number']
    #   @info["points_username"] = points['username']
    #   @scores_array << @info
    # end

    render json: @scores_array

  end

  def show
    @jump = Jump.find(params[:id])
    render json: @jump
  end


  private

  def jump_params
    params.require(:jump).permit(
    :username,
    :ipa,
    :jump_name,

    :deaths,
    :points,
    :jumps,
    :streak,
    )
  end

end
