class Users::ConversationsController < ApplicationController

  before_filter :authenticate_user!
  helper_method :mailbox, :conversation

  def create
    #recipient_emails = conversation_params(:recipients).split(',')
    #recipients = User.where(email: recipient_emails).all
    #
    #conversation = current_user.send_message(recipients, *conversation_params(:body, :subject)).conversations
    #
    #redirect_to conversation
  end

  def reply
    #curren
  end

  def trash
  end

  def untrash
  end

  private

  def mailbox
    #@mailbox ||= current_user.mailbox
  end

end
