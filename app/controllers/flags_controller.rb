class FlagsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @flags = @user.flags
    unless @flags.empty?
      render json: @flags
    else
      render json: {response: 'No flags for this user'}
    end
  end

  def create
    if params[:flaggable_type]
      item = params[:flaggable_type]
    else
      item = ''
    end

    if item.downcase == 'post'
      flaggable = Post.find(params[:flaggable])
    else
      flaggable = Comment.find(params[:flaggable])
    end

    @flag = Flag.new(user_id: params[:user_id].to_i, flaggable: flaggable, flaggable_type: params[:flaggable_type].capitalize)
    if @flag.save
      render json: @flag.id
    else
      render json: {response: '404, flag not saved'}
    end
  end

  def destroy
    @flag = Flag.find(params[:id])
    if @flag.destroy
      render json: {response: '200'}
    else
      render json: {response: '500'}
    end
  end

  # private
  # # def flag_params
  # #   params.require(:flag).permit(:user, :flaggable, :flaggable_type)
  # # end
end
