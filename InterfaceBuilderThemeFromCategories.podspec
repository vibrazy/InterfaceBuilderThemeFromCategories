#
# Be sure to run `pod lib lint InterfaceBuilderThemeFromCategories.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "InterfaceBuilderThemeFromCategories"
  s.version          = "0.1.1"
  s.summary          = "Remove all boiler place styling code from your views/controllers"
  s.description      = <<-DESC
                       Remove all boiler place styling code from your views/controllers for setting Fonts and Colors dynamically from UIColor and UIFont categories. Do it all in Interface Builder, using some magic and IBDesinable
                       DESC
  s.homepage         = "https://github.com/vibrazy/InterfaceBuilderThemeFromCategories"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Daniel Tavares" => "vibrazy@hotmail.com" }
  s.source           = { :git => "https://github.com/vibrazy/InterfaceBuilderThemeFromCategories.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/vibrazy'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'InterfaceBuilderThemeFromCategories' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
