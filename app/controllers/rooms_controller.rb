class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
      @room = current_user.rooms.build(room_params)
      #以下のsaveメソッドで未保存
      if @room.save
        flash[:notice] = "ルームを新規登録しました"
        redirect_to :rooms
      else
        #こちらの処理が実行されます。
        flash[:alert] = "全ての項目を入力してください"
        render "new"
      end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
      @room.destroy
      flash[:notice] = "ルームを削除しました"
      redirect_to :rooms
  end
  
  private
  def room_params
    params.require(:room).permit(:room_name, :description, :price, :address, :image)
  end
end
