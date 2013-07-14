class StaticPagesController < ApplicationController

  layout "static_page", except: [:home]

  def home
    @project = Project.new
  end

  def faqs
  end

  def about
  end

  def contact
  end

  def jobs
  end

  def test_ajax
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def pitch
    pdf_filename = File.join(Rails.root, "lib/assets/pitch.pdf")
    send_file pdf_filename, :filename => "pitch.pdf", :disposition => 'inline', :type => "application/pdf"
  end

  def how_it_works
  end

  def team
  end

  def for_professionals
  end

  def privacy_policy
  end

  def consumer_terms
  end

  def contractor_terms
    
  end

end
