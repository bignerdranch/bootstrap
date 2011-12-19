include_recipe 'homebrew'

package 'postgresql'

execute 'launch postgresql on startup' do
  command <<-EOF
    initdb /usr/local/var/postgres
    mkdir -p ~/Library/LaunchAgents
    cp /usr/local/Cellar/postgresql/9.1.2/org.postgresql.postgres.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/org.postgresql.postgres.plist
  EOF
  not_if 'test -e ~/Library/LaunchAgents/org.postgresql.postgres.plist'
end
