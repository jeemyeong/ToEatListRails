CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJLJZ3AZCCWMQEW3A',
      :aws_secret_access_key  => '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',
      :region                 => 'ap-northeast-2'
  }
  config.fog_directory  = 'jeemyeongrails'
end
