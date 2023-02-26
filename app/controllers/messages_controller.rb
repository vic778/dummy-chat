class MessagesController < PermissionsController
    before_action :set_conversation
    before_action :authenticate_user!
    
    def index
        messages = @conversation.messages
        render json: messages
    end
    
    # def create
    #     message = current_user.messages.build(message_params)
    #     message.conversation_id = @conversation.id
    #     if message.save
    #     render json: message
    #     else
    #     render json: message.errors, status: :unprocessable_entity
    #     end
    # end

    def create
        message = current_user.messages.build(message_params)
        message.conversation_id = @conversation.id
        if message.save
          message.broadcast_after_create
          render status: :ok, template: 'messages/create', locals: { message: message }
        else
          render json: message.errors, status: :unprocessable_entity
        end
    end
      
      
    
    private
    
    def set_conversation
        @conversation = Conversation.find_by(id: params[:conversation_id])
    end
    
    def message_params
        params.permit(:body, :conversation_id)
    end
end
