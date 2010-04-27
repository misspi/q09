# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "authlogic"
  config.gem "newrelic_rpm"
  config.gem 'flyerhzm-bullet', :lib => 'bullet', :source => 'http://gems.github.com'
  config.gem 'paperclip', :lib => 'paperclip', :source => 'http://gems.github.com'
  config.gem 'inherited_resources', :source => 'http://gemcutter.org', :version => '1.0.3'
  config.gem 'cancan'
  config.gem 'searchlogic'
  config.gem 'formtastic'

  config.time_zone = 'UTC'
  config.i18n.default_locale = :es

  config.action_controller.resources_path_names = { :new => 'nueva', :edit => 'cambia' }
  config.action_controller.page_cache_directory = RAILS_ROOT + "/public/cache/"
end

ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| "<span class='fieldWithErrors'>#{html_tag}</span>" }


