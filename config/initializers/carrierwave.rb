# Allow non-ascii letters in uploaded filenames
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'forlee'
  config.aws_acl    = :public_read
	config.asset_host = 'https://s3-ap-northeast-2.amazonaws.com/forlee'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id: 'AKIAIKHH66Y2OGKMVMCQ',
    secret_access_key: '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',
		region: 'ap-northeast-2'
  }
end
