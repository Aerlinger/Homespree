class StaticPagesController < ApplicationController

  layout "static_page", except: [:home]

  def home
  end

  def contractors
  end

  def homeowners
  end

  def about
  end

  def contact
  end

  def jobs
  end

  def test_theme
  end

  def pitch
    pdf_filename = File.join(Rails.root, "lib/assets/pitch.pdf")
    send_file pdf_filename, :filename => "pitch.pdf", :disposition => 'inline', :type => "application/pdf"
  end

end
