class ConversationsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_conversation, only: :remove

  def index
    @conversations = current_user.mailbox.conversations
  end

  def new
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    #flash[:success] = "Your message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    #flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def destroy
    conversation.mark_as_deleted(current_user)
    redirect_to conversations_path
    #current_user.mailbox.conversations(conversation).destroy
  end

  # def trash
  #   conversation.move_to_trash(current_user)
  #   redirect_to mailbox_inbox_path
  # end

  # def untrash
  #   conversation.untrash(current_user)
  #   redirect_to mailbox_inbox_path
  # end

  private

  def set_conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end

  def conversation_params
    params.require(:conversation).permit(:subject, :body, recipients:[])
  end
end
