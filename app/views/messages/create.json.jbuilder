json.extract! message, :id, :body, :created_at, :user_id, :conversation_id
ActionCable.server.broadcast "conversation_#{message.conversation_id}", message
