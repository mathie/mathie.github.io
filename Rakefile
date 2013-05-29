task :default => :publish

desc "Remove the generated site entirely."
task :clean do
  sh "rm -rf _site"
end

desc "Build the full site."
task :build => :clean do
  sh "bundle exec jekyll build"
end

desc "Publish the site to S3."
task :publish => :build do
  sh "s3cmd sync --delete-removed --acl-public --guess-mime-type _site/ s3://woss.name"
end
