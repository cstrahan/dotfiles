require 'shellwords'
require 'open3'
require 'fileutils'

# Inspired by: https://github.com/sorin-ionescu/dot-files/blob/master/Rakefile
# Wrapper around Keychain.
class KeychainError < Exception
end

module Keychain
  ACCOUNT_REGEXP = /"acct"<blob>=(?:0x([0-9A-F]+)\s*)?(?:"(.*)")?$/
  PASSWORD_REGEXP = /^password: (?:0x([0-9A-F]+)\s*)?(?:"(.*)")?$/

  KEYCHAIN_GENERIC_PASSWORD_COMMAND = 'security find-generic-password -gl'
  KEYCHAIN_INTERNET_PASSWORD_COMMAND = 'security find-internet-password -gl'

  # Holds previously requested Keychain items.
  @@cache = {}

  # Wrapper around a Keychain item.
  class Item
    # Returns the accout name.
    attr_reader :account
    # Returns the account password.
    attr_reader :password

    # Returns a new Keychain item.
    #
    # @param [String] account the account name.
    # @param [String] password the account password.
    # @return [Item] the Keychain item.
    def initialize(account, password)
      @account = account or raise ArgumentError, "Account cannot be nil"
      @password = password or raise ArgumentError, "Password cannot be nil"
    end
  end

  # Returns a Keychain item.
  #
  # @param [String] label the Keychain item label.
  # @return [Item] the Keychain item.
  def self.[](label)
    return @@cache[label] if @@cache.has_key? label
    retry_times = 2
    keychain_command = KEYCHAIN_INTERNET_PASSWORD_COMMAND
    begin
      stdin, stdout, stderr = Open3.popen3("#{keychain_command} #{label.shellescape}")
      output = stdout.readlines.join + stderr.readlines.join
      [stdin, stdout, stderr].each { |stdio| stdio.close }
      if output =~ /The specified item could not be found in Keychain\./
        raise NameError
      end
      # The field value is stored in hexademical (one) or string (two).
      field_value = lambda do |one, two|
        return one.scan(/../).map { |tuple| tuple.hex.chr }.join unless one.nil?
        return two unless two.nil?
        return ""
      end
      account = \
        output[ACCOUNT_REGEXP].gsub!(ACCOUNT_REGEXP) { field_value[$1, $2] }
      password = \
        output[PASSWORD_REGEXP].gsub!(PASSWORD_REGEXP) { field_value[$1, $2] }
      @@cache[label] = Item.new(account, password)
    rescue NameError
      keychain_command = KEYCHAIN_GENERIC_PASSWORD_COMMAND
      retry_times -= 1
      if retry_times > 0
        retry
      else
        raise KeychainError,
          "Item '#{label}' could not be found in Keychain"
      end
    rescue IOError
      raise KeychainError,
        "Could not communicate with Keychain for item '#{label}'"
    end
  end
end
