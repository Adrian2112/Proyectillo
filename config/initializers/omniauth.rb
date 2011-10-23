Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'eYNdhbI2oMfPIvBaFxQQgw', 'ax4fqoa6yDSSNqYBEL8pj7DBvlu3VKdWRufSE08OuY'
  provider :facebook, '186103744801781', '9cd56fdca66b3895396474e85da438f0', {:scope => 'publish_stream,offline_access, email'}
end


