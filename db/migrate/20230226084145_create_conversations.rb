class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.integer :sender_id, null:  false
      t.integer :recipient_id, null: false
      t.timestamps
    end
  end
end
