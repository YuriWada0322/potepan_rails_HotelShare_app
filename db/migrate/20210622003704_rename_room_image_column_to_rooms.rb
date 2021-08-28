class RenameRoomImageColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :room_image, :image
  end
end
