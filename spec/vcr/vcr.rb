VCR.config do |c|
  c.cassette_library_dir  = Rails.root.join("spec", "vcr")
  c.stub_with :fakeweb

  c.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split()
  end
end