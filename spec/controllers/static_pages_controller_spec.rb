require 'spec_helper'

describe StaticPagesController do

  it "should respond to '/home'" do
    get 'home'
    expect(response).to render_template :home
  end

  it "should respond to '/faqs'" do
    get 'faqs'
    expect(response).to render_template :faqs
  end

  it "should respond to '/contractors_preview'" do
    get 'contractors_preview'
    expect(response).to render_template :contractors
  end

  it "should respond to '/about'" do
    get 'about'
    expect(response).to render_template :about
  end
  it "should respond to '/contact'" do
    get 'contact'
    expect(response).to render_template :contact
  end
  it "should respond to '/jobs'" do
    get 'jobs'
    expect(response).to render_template :jobs
  end


end
