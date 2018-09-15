# frozen_string_literal: true

require 'site_prism/error'
require 'addressable/template'

module SitePrism
  autoload :ElementContainer, 'site_prism/element_container'
  autoload :ElementChecker, 'site_prism/element_checker'
  autoload :Page, 'site_prism/page'
  autoload :Section, 'site_prism/section'
  autoload :Waiter, 'site_prism/waiter'
  autoload :AddressableUrlMatcher, 'site_prism/addressable_url_matcher'

  class << self
    def configure
      yield self
    end

    attr_reader :use_implicit_waits

    def use_implicit_waits=(value)
      show_removed_config_warning_messages
      @use_implicit_waits = value
    end

    attr_reader :raise_on_wait_fors

    def raise_on_wait_fors=(value)
      show_removed_config_warning_messages
      @raise_on_wait_fors = value
    end

    attr_reader :default_load_validations

    def default_load_validations=(value)
      show_removed_config_warning_messages
      @default_load_validations = value
    end

    def show_removed_config_warning_messages
      warn 'This config option is being removed in SitePrism v3. See UPGRADING.md on the repo for more details.'
      warn 'Going forwards the configuration / configurability will more closely mimic Capybara.'
    end
  end

  @default_load_validations = true
  @use_implicit_waits = false
  @raise_on_wait_fors = false
end
