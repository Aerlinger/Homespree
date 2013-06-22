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

  it "should respond to '/about'" do
    get 'about'
    expect(response).to render_template :about
  end

  it "should respond to '/how_it_works'" do
    get 'how_it_works'
    expect(response).to render_template "static_pages/how_it_works"
  end

  it "should respond to '/contact'" do
    get 'contact'
    expect(response).to render_template :contact
  end

  it "should respond to '/jobs'" do
    get 'jobs'
    expect(response).to render_template :jobs
  end

  it "should respond to '/team'" do
    get 'team'
    expect(response).to render_template :team
  end

  it "should respond to '/for_professionsals'" do
    get 'for_professionals'
    expect(response).to render_template :for_professionals
  end

end
