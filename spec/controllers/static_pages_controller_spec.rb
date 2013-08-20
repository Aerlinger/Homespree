require 'spec_helper'

describe StaticPagesController do

  it "responds to '/home'" do
    get 'home'
    expect(response).to render_template :home
  end

  it "responds to '/faqs'" do
    get 'faqs'
    expect(response).to render_template :faqs
  end

  it "responds to '/about'" do
    get 'about'
    expect(response).to render_template :about
  end

  it "responds to '/how_it_works'" do
    get 'how_it_works'
    expect(response).to render_template "static_pages/how_it_works"
  end

  it "responds to '/contact'" do
    get 'contact'
    expect(response).to render_template :contact
  end

  it "responds to '/jobs'" do
    get 'jobs'
    expect(response).to render_template :jobs
  end

  it "responds to '/team'" do
    get 'team'
    expect(response).to render_template :team
  end

  it "responds to '/for_professionsals'" do
    get 'for_professionals'
    expect(response).to render_template :for_professionals
  end

end
