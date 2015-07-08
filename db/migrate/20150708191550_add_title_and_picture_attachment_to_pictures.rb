class AddTitleAndPictureAttachmentToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :title, :string
    add_attachment :pictures, :image
  end
end
