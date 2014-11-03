Pod::Spec.new do |s|
  s.name         = 'UIBubbleTableView'
  s.author       = 'chope'
  s.summary      = 'modified UIBubbleTableView by chope'
  s.version      = '1.0'
  s.license      = 'Creative Commons Attribution 3.0 Unported License'
  s.homepage     = 'https://github.com/chope-yoonhg84/UIBubbleTableView'
s.source       = { :git => 'https://github.com/chope-yoonhg84/UIBubbleTableView.git', :tag => 'v1.0' }
  s.platform     = :ios, '8.1'
  s.source_files = 'src/*.{h,m}'
  s.requires_arc = true
end