class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
