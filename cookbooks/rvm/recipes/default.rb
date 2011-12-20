include_recipe 'git'

bash "install rvm" do
  code <<-EOF
    bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> $HOME/.bash_profile
    source $HOME/.bash_profile
  EOF
  not_if "type rvm | head -1 | grep 'rvm is a shell function'"
end

node[:rvm][:rubies].each do |ruby|
  bash "install ruby #{ruby}" do
    code "source $HOME/.rvm/scripts/rvm && rvm install #{ruby}"
  end
end