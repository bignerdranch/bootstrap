json_attribs    'https://raw.github.com/highgroove/bootstrap/chef.json'
recipe_url      'https://github.com/downloads/highgroove/bootstrap/cookbooks.tar.gz'
cookbook_path   File.join(File.dirname(__FILE__), '..', 'cookbooks')
file_store_path File.join(File.dirname(__FILE__), '..')
file_cache_path File.join(File.dirname(__FILE__), '..')
log_level :debug