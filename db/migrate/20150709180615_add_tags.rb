class AddTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.column :name, :string
      t.column :picture_id, :integer
      t.column :user_id, :integer
    end
  end
end
