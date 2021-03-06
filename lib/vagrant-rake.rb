require 'vagrant'
require 'vagrant-rake/config'
require 'vagrant-rake/command'
require 'vagrant-rake/middleware'

# Create a new middleware stack "rake" which is executed for
# rake commands. See the VagrantRake::Middleware docs for more
# information.
rake = Vagrant::Action::Builder.new do
  use VagrantRake::Middleware
end

Vagrant::Action.register(:rake, rake)

# Add our custom translations to the load path
I18n.load_path << File.expand_path("../../locales/en.yml", __FILE__)
