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
  s.version      = "0.2.0"
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
  s.source       = { :http => "https://downloads.rongcloud.cn/QRongIM.zip" }
  #s.source           = { :git => 'https://github.com/loginSin/QTestIMSDK.git', :tag => s.version.to_s }
  #s.default_subspec = 'IMLib', 'IMKit'
  s.requires_arc = true

  s.subspec 'IMLibCore' do |core|
    core.source_files = 'QRongIM/RongIMLibCore.framework/Headers/*.h'
    core.public_header_files = 'QRongIM/RongIMLibCore.framework/Headers/*.h'
    core.vendored_frameworks = "QRongIM/RongIMLibCore.framework"
    core.resources = "QRongIM/RCConfig.plist"
    core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'ChatRoom' do |cr|
    cr.source_files = 'QRongIM/RongChatRoom.framework/Headers/*.h'
    cr.public_header_files = 'QRongIM/RongChatRoom.framework/Headers/*.h'
    cr.vendored_frameworks = "QRongIM/RongChatRoom.framework"
    cr.dependency 'QRongIM/IMLibCore'
    cr.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'CustomerService' do |cs|
    cs.source_files = 'QRongIM/RongCustomerService.framework/Headers/*.h'
    cs.public_header_files = 'QRongIM/RongCustomerService.framework/Headers/*.h'
    cs.vendored_frameworks = "QRongIM/RongCustomerService.framework"
    cs.dependency 'QRongIM/IMLibCore'
    cs.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'Discussion' do |discussion|
    discussion.source_files = 'QRongIM/RongDiscussion.framework/Headers/*.h'
    discussion.public_header_files = 'QRongIM/RongDiscussion.framework/Headers/*.h'
    discussion.vendored_frameworks = "QRongIM/RongDiscussion.framework"
    discussion.dependency 'QRongIM/IMLibCore'
    discussion.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'PublicService' do |ps|
    ps.source_files = 'QRongIM/RongPublicService.framework/Headers/*.h'
    ps.public_header_files = 'QRongIM/RongPublicService.framework/Headers/*.h'
    ps.vendored_frameworks = "QRongIM/RongPublicService.framework"
    ps.dependency 'QRongIM/IMLibCore'
    ps.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'Location' do |rtl|
    rtl.source_files = 'QRongIM/RongLocation.framework/Headers/*.h'
    rtl.public_header_files = 'QRongIM/RongLocation.framework/Headers/*.h'
    rtl.vendored_frameworks = "QRongIM/RongLocation.framework"
    rtl.dependency 'QRongIM/IMLibCore'
    rtl.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'IMLib' do |lib|
    lib.source_files = 'QRongIM/RongIMLib.framework/Headers/*.h'
    lib.public_header_files = 'QRongIM/RongIMLib.framework/Headers/*.h'
    lib.vendored_frameworks = "QRongIM/RongIMLib.framework"
    lib.dependency 'QRongIM/IMLibCore'
    lib.dependency 'QRongIM/ChatRoom'
    lib.dependency 'QRongIM/Discussion'
    lib.dependency 'QRongIM/PublicService'
    lib.dependency 'QRongIM/CustomerService'
    lib.dependency 'QRongIM/Location'
    lib.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'IMKit' do |kit|
    kit.resources = "QRongIM/RongCloud.bundle", "QRongIM/en.lproj", "QRongIM/zh-Hans.lproj", "QRongIM/ar.lproj", "QRongIM/Emoji.plist", "QRongIM/RCColor.plist"
    kit.source_files = 'QRongIM/RongIMKit/**/*.{h,m,c}'
    kit.dependency 'QRongIM/IMLib'
  end

  s.subspec 'RongSticker' do |rs|
    rs.resources = "QRongIM/RongSticker.bundle", "QRongIM/en.lproj", "QRongIM/zh-Hans.lproj", "QRongIM/ar.lproj"
    rs.source_files = 'QRongIM/RongSticker.framework/Headers/*.h'
    rs.public_header_files = 'QRongIM/RongSticker.framework/Headers/*.h'
    rs.vendored_frameworks = "QRongIM/RongSticker.framework"
    rs.dependency 'QRongIM/IMKit'
  end
  
  s.subspec 'Sight' do |st|
  st.source_files = 'QRongIM/RongSight.framework/Headers/*.h'
  st.public_header_files = 'QRongIM/RongSight.framework/Headers/*.h'
  st.vendored_frameworks = "QRongIM/RongSight.framework"
  st.dependency 'QRongIM/IMKit'
  end

end
