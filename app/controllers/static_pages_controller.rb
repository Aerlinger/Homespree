class StaticPagesController < ApplicationController

  layout "static_page", except: [:home]

  def home
  end

  def faqs
  end

  def about
  end

  def contact
  end

  def jobs
  end

  def test_theme
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

  def contractor_overview
    
  end

  def contractor_how_it_works
    
  end

  def for_professionals

  end

end
