#
#  Be sure to run `pod spec lint MVoIP.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |s|


  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #


  s.name         = "QRongIM"
  s.version      = "0.1.0"
  s.summary      = "RongCloud IM SDK.(如果看不到最新版本，请使用 pod repo update 命令更新一下本地pod仓库，从 2.9.0 版本开始这里不再包含 CallKit 和 CallLib 类库的管理，音视频服务升级为融云自有音视频，2.9.0 版本之前用户请根据站内信提示更新)"


  s.description  = <<-DESC
                   RongCloud IM SDK for iOS.


                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC


  s.homepage     = "https://github.com/loginSin"
  s.license      = { :type => "Copyright", :text => "Copyright 2021 loginSin" }
  s.author             = { "loginSin" => "https://github.com/loginSin" }
  s.social_media_url   = "loginSin"
  s.platform     = :ios, "8.0"
  s.source       = { :http => "https://media.githubusercontent.com/media/loginSin/QTestIMSDK/main/RongCloudIM.zip" }
  #s.default_subspec = 'IMLib', 'IMKit'
  s.requires_arc = true

  s.subspec 'IMLibCore' do |core|
    core.source_files = 'RongCloudIM/RongIMLibCore.framework/Headers/*.h'
    core.public_header_files = 'RongCloudIM/RongIMLibCore.framework/Headers/*.h'
    core.vendored_frameworks = "RongCloudIM/RongIMLibCore.framework"
    core.resources = "RongCloudIM/RCConfig.plist"
    core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'ChatRoom' do |cr|
    cr.source_files = 'RongCloudIM/RongChatRoom.framework/Headers/*.h'
    cr.public_header_files = 'RongCloudIM/RongChatRoom.framework/Headers/*.h'
    cr.vendored_frameworks = "RongCloudIM/RongChatRoom.framework"
    cr.dependency 'RongCloudIM/IMLibCore'
    cr.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'CustomerService' do |cs|
    cs.source_files = 'RongCloudIM/RongCustomerService.framework/Headers/*.h'
    cs.public_header_files = 'RongCloudIM/RongCustomerService.framework/Headers/*.h'
    cs.vendored_frameworks = "RongCloudIM/RongCustomerService.framework"
    cs.dependency 'RongCloudIM/IMLibCore'
    cs.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'Discussion' do |discussion|
    discussion.source_files = 'RongCloudIM/RongDiscussion.framework/Headers/*.h'
    discussion.public_header_files = 'RongCloudIM/RongDiscussion.framework/Headers/*.h'
    discussion.vendored_frameworks = "RongCloudIM/RongDiscussion.framework"
    discussion.dependency 'RongCloudIM/IMLibCore'
    discussion.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'PublicService' do |ps|
    ps.source_files = 'RongCloudIM/RongPublicService.framework/Headers/*.h'
    ps.public_header_files = 'RongCloudIM/RongPublicService.framework/Headers/*.h'
    ps.vendored_frameworks = "RongCloudIM/RongPublicService.framework"
    ps.dependency 'RongCloudIM/IMLibCore'
    ps.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'Location' do |rtl|
    rtl.source_files = 'RongCloudIM/RongLocation.framework/Headers/*.h'
    rtl.public_header_files = 'RongCloudIM/RongLocation.framework/Headers/*.h'
    rtl.vendored_frameworks = "RongCloudIM/RongLocation.framework"
    rtl.dependency 'RongCloudIM/IMLibCore'
    rtl.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'IMLib' do |lib|
    lib.source_files = 'RongCloudIM/RongIMLib.framework/Headers/*.h'
    lib.public_header_files = 'RongCloudIM/RongIMLib.framework/Headers/*.h'
    lib.vendored_frameworks = "RongCloudIM/RongIMLib.framework"
    lib.dependency 'RongCloudIM/IMLibCore'
    lib.dependency 'RongCloudIM/ChatRoom'
    lib.dependency 'RongCloudIM/Discussion'
    lib.dependency 'RongCloudIM/PublicService'
    lib.dependency 'RongCloudIM/CustomerService'
    lib.dependency 'RongCloudIM/Location'
    lib.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'IMKit' do |kit|
    kit.resources = "RongCloudIM/RongIMKit/Resource/RongCloud.bundle", "RongCloudIM/RongIMKit/Resource/en.lproj", "RongCloudIM/RongIMKit/Resource/zh-Hans.lproj", "RongCloudIM/RongIMKit/Resource/ar.lproj", "RongCloudIM/RongIMKit/Resource/Emoji.plist", "RongCloudIM/RongIMKit/Resource/RCColor.plist"
    kit.source_files = 'RongCloudIM/RongIMKit/**/*'
    kit.dependency 'RongCloudIM/IMLib'
  end

  s.subspec 'RongSticker' do |rs|
    rs.resources = "RongCloudIM/RongSticker.bundle", "RongCloudIM/en.lproj", "RongCloudIM/zh-Hans.lproj", "RongCloudIM/ar.lproj"
    rs.source_files = 'RongCloudIM/RongSticker.framework/Headers/*.h'
    rs.public_header_files = 'RongCloudIM/RongSticker.framework/Headers/*.h'
    rs.vendored_frameworks = "RongCloudIM/RongSticker.framework"
    rs.dependency 'RongCloudIM/IMKit'
  end
  
  s.subspec 'Sight' do |st|
  st.source_files = 'RongCloudIM/RongSight.framework/Headers/*.h'
  st.public_header_files = 'RongCloudIM/RongSight.framework/Headers/*.h'
  st.vendored_frameworks = "RongCloudIM/RongSight.framework"
  st.dependency 'RongCloudIM/IMKit'
  end

end
