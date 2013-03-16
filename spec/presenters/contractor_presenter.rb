require 'spec_helper'

class UserPresenterTest < ActionView::TestCase


  it "Says when none given" do
    view.current_user
    presenter = UserPresenter.new(User.new, view)
    presenter.website.should include("None given")
  end
end