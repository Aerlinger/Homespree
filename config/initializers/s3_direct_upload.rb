S3DirectUpload.config do |c|
  c.access_key_id = "AKIAJ7GJGNEY4MU2TPGQ"       # your access key id
  c.secret_access_key = "Ix1uJr6njPaH3QjevozqPP7rtMWNtvai9K7sak2r"   # your secret access key
  c.bucket = "contractor_portraits"              # your bucket name
  #c.region = nil             # region prefix of your bucket url (optional), eg. "s3-eu-west-1"
  c.url = "https://contractor_portraits.s3-website-us-east-1.amazonaws.com"                # S3 API endpoint (optional), eg. "https://#{c.bucket}.s3.amazonaws.com/"
end