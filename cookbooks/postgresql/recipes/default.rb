include_recipe 'homebrew'

package 'postgresql'

execute 'launch postgresql on startup' do
  command <<-EOF
    initdb /usr/local/var/postgres
    mkdir -p ~/Library/LaunchAgents
    plist=`brew list postgres | grep org.postgresql.postgres.plist`
    cp $plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/org.postgresql.postgres.plist
  EOF
  not_if 'test -e ~/Library/LaunchAgents/org.postgresql.postgres.plist'
end
