include_recipe 'git'

bash "install rvm" do
  code 'bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )'
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