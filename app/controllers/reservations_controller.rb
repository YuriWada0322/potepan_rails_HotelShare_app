class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    @reservation.total = @reservation.room.price * (@reservation.end_date - @reservation.start_date) * @reservation.people
    if @reservation.save
      flash[:notice] = "予約内容を確認してください"
      redirect_to @reservation
    else
      flash[:alert] = "予約ができませんでした"
      render "rooms/show"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
      flash[:notice] = "予約が完了しました"
      redirect_to :reservations
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約をキャンセルしました"
    redirect_to :reservations
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :people, :total, :room_id, :user_id, :image)
  end
end
