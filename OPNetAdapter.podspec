Pod::Spec.new do |s|
  s.name             = 'OPNetAdapter'
  s.version          = '0.1.0'
  s.summary          = 'Used for auto generate codes.'

  s.description      = <<-DESC
Used for auto generate codes, base on AFNetworking and Mantle.
                       DESC

  s.homepage         = 'https://github.com/sunboshi/OPNetAdapter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunboshi' => 'boshi@sunboshi.tech' }
  s.source           = { :git => 'https://github.com/sunboshi/OPNetAdapter.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'OPNetAdapter/*'
  
  s.dependency 'AFNetworking', '~> 3.0'
  s.dependency 'Mantle'

end
