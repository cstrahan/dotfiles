#!/usr/bin/env ruby

require 'rubygems'

module OSUtil
  private
  def is_windows?
    !!(Config::CONFIG['host_os'] =~ /windows/i)
  end
  def is_ubuntu?
    !is_windows? && !!(`uname -a` =~ /ubuntu/i)
  end
  def is_mac?
    !is_windows? && !!(`uname -a` =~ /darwin/i)
  end
end
include OSUtil


