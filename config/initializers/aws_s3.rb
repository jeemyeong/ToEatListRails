CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => '',
      :aws_secret_access_key  => 'm4y60oYWpL7EsdOldtXp18w3NOYQAuh+YWRnyBzT',
      :region                 => 'ap-northeast-2'
  }
  config.fog_directory  = 'jeemyeongrails'
end
