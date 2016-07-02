Pod::Spec.new do |s|

  s.name         = "GongJuTai"
  s.version      = "1.0.2"
  s.summary      = "GongJuTai is a high level request util based on AFNetworking."
  s.homepage     = "https://github.com/zhangpengfic/GongJuTai"
  s.license      = "MIT"
  s.author             = {
                          "Alfred" => "75756414@qq.com",
 }
  s.source        = { :git => "https://github.com/zhangpengfic/GongJuTai.git", :tag => "1.0.2" }
  s.source_files  = "GongJuTai/GongJu/*.{h,m,swift}"
  s.platform      = :ios, '8.0'
  s.requires_arc  = true
  s.dependency "AFNetworking", "~> 3.0"

end