#
#  Be sure to run `pod spec lint ATSGLoader.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "ATSGProgress"
s.version      = "0.0.2"
s.summary      = "ATSGProgress is a simple activity indicator to use in all application."
s.description  = <<-DESC
ATSGProgress is a simple activity indicator to use in all application. This Library display a activity indicator loading view with text in a center of screen and disable user interaction.

DESC

s.homepage     = "https://github.com/asgapps/ATSGProgress"
s.authors      = { "Antonio Serrano" => "serranogomezantonio@gmail.com" }
s.license      = "MIT"
s.source       = { :git => "https://github.com/asgapps/ATSGProgress.git", :tag => s.version }
s.source_files  = "ATSGProgress/Files/*.swift"
s.ios.deployment_target = "8.0"

s.framework = "UIKit"
s.dependency 'NVActivityIndicatorView', '~> 3.0'


end
