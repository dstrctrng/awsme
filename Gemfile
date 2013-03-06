source "https://rubygems.org"

gemspec

def dev(nm_gem, workarea)
  gem nm_gem, (ENV["EDIT_#{nm_gem.gsub("-","_")}"] ? { :path => "#{workarea}/#{nm_gem}" } : {})
end

gem "tvd-tvdinner" unless File.exists?(File.expand_path("../tvd-tvdinner.gemspec", __FILE__))
gem "chefspec"
gem "minitest-chef-handler"
gem "foodcritic", :platforms => :ruby_19

gem "aws-sdk"

dev "tvd-vagrant", "git"
