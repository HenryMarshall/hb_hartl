class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    # this is a multiple key index -- it uses both at the same time
    add_index :microposts, [:user_id, :created_at]
  end
end
