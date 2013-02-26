class ChangeImgTypeInImage < ActiveRecord::Migration
  def change
    change_column :images, :img, :text
  end
end
