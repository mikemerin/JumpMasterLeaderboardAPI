class api::V1::JumpsController < ApplicationController

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

  # def top_jumps_with_names
  #   # array of hashes
  #   @array = [
  #     "16px", "rdiagonal", "cdiagonal", "rukito",
  #     "tas", "uvalve", "dvalve", "fang",
  #     "invert", "rcorner", "charlie", "superf",
  #     "dplane", "jdiamond", "cddiamond", "45",
  #     "boxcorner", "fspike", "bvalve", "tvalve", "dcascade", "?????", "minif", "dinvert", "ljump", "dbvalve", "ldiamond"
  #     ];
  #
  #   @jump_types = [];
  #
  #   @array.each do |jump|
  #     ['_jumps', '_streak', '_points'].each do |type|
  #       @jump_types << jump + type;
  #     end
  #   end
  #
  #   @jumps = {};
  #
  #   @jump_types.each do |type|
  #     @jumps[type] = { 'username' => '', 'multi' => {}, 'id' => '', 'number' => 0 };
  #   end
  #
  #   Jumps.all.each do |score|
  #     @jump_types.each do |type|
  #       if (score[type.to_sym].round(2) > @scores[type]['number']) then
  #         @scores[type]['number'] = score[type.to_sym].round(2);
  #         @scores[type]['username'] = score[:'username'];
  #         @scores[type]['multi'] = {};
  #         @scores[type]['multi'][score[:'username']] = [score[:'id']];
  #         @scores[type]['id'] = score[:'id'];
  #       elsif (score[type.to_sym].round(2) == @scores[type]['number']) then
  #         if (@scores[type]['multi'][score[:'username']]) then
  #           @scores[type]['multi'][score[:'username']] << score[:'id'];
  #         else
  #           @scores[type]['multi'][score[:'username']] = [score[:'id']];
  #           @scores[type]['username'] = 'Multiple People';
  #           @scores[type]['id'] = '';
  #         end
  #       end
  #     end
  #   end
  #
  #   render json: @jumps
  #
  # end

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
