class FriendshipsController < ApplicationController
  before_filter :authenticate_user!

  # GET /friendships
  # GET /friendships.json
  def index
    @users = User.all
    @friendships = Friendship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friendships }
    end
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to :back, notice: 'Friendship was successfully created.' }
        format.json { render json: @friendship, status: :created, location: @friendship }
      else
        format.html { flash[:error] = "Unable to add friend." }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
