CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIAI5NINDTGHCWWDDOQ",
    aws_secret_access_key: "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"
  }
  config.fog_directory = "contractor_logos"
end