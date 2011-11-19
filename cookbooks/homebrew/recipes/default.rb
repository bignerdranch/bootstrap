execute "install homebrew" do
  command '/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"'
  user ENV['SUDO_USER']
  group "staff"
  not_if 'test -e /usr/local/bin/brew'
end
