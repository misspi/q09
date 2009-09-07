
Buckets.configure do |config|
  config.layout = 'basic'
  config.before_filter :admin_required
end