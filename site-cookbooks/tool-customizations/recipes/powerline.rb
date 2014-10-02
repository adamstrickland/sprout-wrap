%w(i3-py Jinja2 paramiko psutil pyuv PYAML salt setuptools vboxapi Powerline).each do |pkg|
  python_pip pkg do
    action :install
  end
end

python_pip "powerline" do
  options "git+git://github.com/Lokaltog/powerline"
  action :install
end

package "macvim" do
  options "--env-std --override-system-vim"
end

homebrew_tap "caskroom/fonts"

%w(inconsolata meslo).each do |font|
  homebrew_cask "font-#{font}-for-powerline"
end

# [
#   {
#     font_name: "Inconsolata-dz for Powerline.otf",
#     font_source: "https://github.com/Lokaltog/powerline-fonts/raw/master/InconsolataDz/Inconsolata-dz%20for%20Powerline.otf",
#     font_checksum: "ee07f7241f5a7fed4a7916962bc5d64b8b8b3cfde588cfc69d9692738a2d48ae"
#   },
#   {
#     font_name: "Meslo LG S DZ Regular for Powerline.otf",
#     font_source: "https://github.com/Lokaltog/powerline-fonts/raw/master/Meslo/Meslo%20LG%20S%20DZ%20Regular%20for%20Powerline.otf",
#     font_checksum: "db19d75a3be4b2efb92495c1b0edcce3754dc7949f1d1eb9eba8271c5ad04c38"
#   }
# ].each do |finfo|
#   font_path = "#{Chef::Config[:file_cache_path]}/#{finf[:font_name]}"
#   font_install_dir = "/Library/Fonts"

#   remote_file font_path do
#     source finfo[:font_source]
#     checksum finfo[:font_checksum]
#   end

#   execute "copy font to #{font_install_dir}" do
#     command "cp #{font_path} #{font_install_dir}"
#     user node['current_user']
#     group "admin"
#     not_if "test -e #{font_install_dir}/#{finfo[:font_name]}"
#   end
# end

# other installs: ColorSnapper
