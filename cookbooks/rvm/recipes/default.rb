include_recipe 'git'

bash "install rvm" do
  code <<-EOF
    bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> /Users/#{ENV["SUDO_USER"]}/.bash_profile
    source /Users/#{ENV["SUDO_USER"]}/.bash_profile
  EOF
  user ENV["SUDO_USER"]
  group "staff"
  not_if "which rvm"
end

node[:rvm][:rubies].each do |ruby|
  execute "install ruby #{ruby}" do
    command "rvm install #{ruby}"
    user ENV["SUDO_USER"]
    group "staff"
  end
end