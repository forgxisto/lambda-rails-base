require 'aws-sdk-s3'
class Article < ApplicationRecord
  has_one_attached :picture

  def download_presigned_url
    return if picture.blank?

    signer = Aws::S3::Presigner.new
    signer.presigned_url(
      :get_object,
      bucket: 'pictures', # S3のバケット名
      key: picture.blob.key, # S3のオブジェクトキー
      expires_in: 600, #urlの有効期限
      secure: true
    )
  end
end
