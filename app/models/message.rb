class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true
  after_create_commit { broadcast_after_create }

  # private

  def broadcast_after_create
    ConversationChannel.broadcast_to(conversation, self)
  end
end
