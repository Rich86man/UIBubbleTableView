Pod::Spec.new do |s|
  s.name         = 'UIBubbleTableView'
  s.author       = 'chope'
  s.summary      = 'modified UIBubbleTableView by chope'
  s.version      = '0.3'
  s.license      = {
    :type => 'Creative Commons Attribution-ShareAlike 3.0 Unported License',
    :text => <<-LICENSE
        Use it, hack it, but give me some love.
        Creative Commons Attribution-ShareAlike 3.0 Unported License.
        See http://creativecommons.org/licenses/by-sa/3.0/ for details.
        For a non-attribution license, contact http://standardorbit.net.
    LICENSE
  }
  s.homepage     = 'https://github.com/chope-yoonhg84/UIBubbleTableView'
s.source       = { :git => 'https://github.com/chope-yoonhg84/UIBubbleTableView.git', :tag => 'v0.3' }
  s.platform     = :ios, '7.0'
  s.source_files = 'src/*.{h,m}'
  s.requires_arc = true
end