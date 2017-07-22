

Pod::Spec.new do |s|
  s.name             = 'LXR_CHNGroup'
  s.version          = '0.1.1'
  s.summary          = 'LXR_CHNGroup中文分组'

  s.description      = 'LXR_CHNGroup中文分组,一句代码搞定'

  s.homepage         = 'https://github.com/qq1932121/LXR_CHNGroup'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1932121@qq.com' => '1932121@qq.com' }
  s.source           = { :git => 'https://github.com/qq1932121/LXR_CHNGroup.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'LXR_CHNGroup/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LXR_CHNGroup' => ['LXR_CHNGroup/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
