include_recipe 'homebrew'

package 'postgresql'

execute 'launch postgresql on startup' do
  command <<-EOF
    initdb /usr/local/var/postgres
    mkdir -p ~/Library/LaunchAgents
    version=`ls /usr/local/Cellar/postgresql/ | sort -n | tail -1`
    cp /usr/local/Cellar/postgresql/$version/org.postgresql.postgres.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/org.postgresql.postgres.plist
  EOF
  not_if 'test -e ~/Library/LaunchAgents/org.postgresql.postgres.plist'
end
