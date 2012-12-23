class CreateBios < ActiveRecord::Migration
  def change
    create_table :bios do |t|
      t.text :content
      t.references :user

      t.timestamps
    end
    add_index :bios, :user_id
  end
end
