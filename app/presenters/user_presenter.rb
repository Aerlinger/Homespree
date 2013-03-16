module UserPresenter

  def member_since
    contractor.created_at.strftime("%B %e, %Y")
  end

end