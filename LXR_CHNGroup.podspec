

Pod::Spec.new do |s|
  s.name             = 'LXR_CHNGroup'
  s.version          = '0.1.9'
  s.summary          = 'LXR_CHNGroup中文分组'

  s.description      = 'LXR_CHNGroup中文分组,一句代码搞定'

  s.homepage         = 'https://github.com/qq1932121/LXR_CHNGroup'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LXR' => '1932121@qq.com' }
  s.source           = { :git => 'https://github.com/qq1932121/LXR_CHNGroup.git', :tag => s.version.to_s }
  s.frameworks = 'UIKit'
  s.ios.deployment_target = '8.0'
  s.source_files = 'LXR_CHNGroup/Classes/**/*'


  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.resource_bundles = {
  #   'LXR_CHNGroup' => ['LXR_CHNGroup/Assets/*.png']
  # }


  # s.dependency 'AFNetworking', '~> 2.3'
end
