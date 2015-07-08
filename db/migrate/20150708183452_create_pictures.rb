class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.column :title, :string
      t.attachment :pictures
    end
  end
end
