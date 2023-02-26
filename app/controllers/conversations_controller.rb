class ConversationsController < PermissionsController 
    before_action :set_conversation, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @conversations = Conversation.all.exept_current_user(current_user)
        render json: @conversations
    end

    def show
        render json: @conversation
    end

    def create
        recipient = User.find_by(name: params[:recipient_name])
        conversation = Conversation.new(sender_id: current_user.id, recipient_id: recipient.id)
        if conversation.save
            render json: conversation
        else
            render json: conversation.errors, status: :unprocessable_entity
        end
    end

    def update
        if @conversation.update(conversation_params)
            render json: @conversation
        else
            render json: @conversation.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @conversation.destroy
    end

    private

    def set_conversation
        @conversation = Conversation.find(params[:id])
    end

    def conversation_params
        params.permit(:sender_id, :recipient_id)
    end

end
