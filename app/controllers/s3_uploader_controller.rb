class S3UploaderController < ApplicationController


  def create
    klass = params[:class]
    @data = klass.create(params[:data])
    render json: {
      :policy => s3_upload_policy_document,
      :signature => s3_upload_signature,
      :key => @document.s3_key,
      :success_action_redirect => document_upload_success_document_url(@document)
    }
  end

  def s3_confirm
    head :ok
  end

  def s3_upload_policy_document
    return @policy if @policy
    ret = {"expiration" => 5.minutes.from_now.utc.xmlschema,
           "conditions" =>  [
             {"bucket" =>  params[:bucket]},
             ["starts-with", "$key", @data.s3_key],
             {"acl" => "private"},
             {"success_action_status" => "200"},
             ["content-length-range", 0, 1048576]
           ]
    }
    @policy = Base64.encode64(ret.to_json).gsub(/\n/,'')
  end

  # sign our request by Base64 encoding the policy document.
  def s3_upload_signature
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), YOUR_SECRET_KEY, s3_upload_policy_document)).gsub("\n","")
  end

end
