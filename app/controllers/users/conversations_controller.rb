class Users::ConversationsController < ApplicationController

  before_filter :authenticate_user!
  helper_method :mailbox, :conversation

  def create
    recipient_emails = params(:recipients).split(',')
    recipients = User.where(email: recipient_emails).all

    conversation = current_user.send_message(recipients, *conversation_params(:body, :subject)).conversations

    redirect_to conversation
  end

  def reply
    current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation
  end

  def show
    conversation.move_to_trash(current_user)
    redirect
  end

  def index
    current_user
  end

  def trash
    conversation.move_to_trash
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

end
