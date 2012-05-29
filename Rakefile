require 'rake'
require 'shellwords'

TOPLEVEL = File.expand_path(File.dirname(__FILE__))
FileUtils.cd(TOPLEVEL)

module DotSettings
  extend self

  def is_windows?
    @is_windows ||= !!(Config::CONFIG['host_os'] =~ /windows/i)
  end

  def is_linux?
    @is_linux ||= !is_windows? && !!(`uname -a` =~ /linux|ubuntu/i)
  end

  def is_mac?
    @is_mac ||= !is_windows? && !!(`uname -a` =~ /darwin/i)
  end

  def sublime_basedir
    if is_windows?
      File.expand_path('%APPDATA%/Sublime Text 2/')
    elsif is_linux?
      File.expand_path('~/.Sublime Text 2/')
    elsif is_mac?
      File.expand_path('~/Library/Application Support/Sublime Text 2/')
    end
  end

  def sublime_installed?
    File.exist?(File.expand_path(sublime_basedir))
  end

  def sublime_user_prefs
    File.join(sublime_basedir,  "Packages/User/Preferences.sublime-settings")
  end

  def sublime_installed_packages
    File.join(sublime_basedir, "Installed Packages")
  end
end
include DotSettings

HOME = if is_windows?
         ENV['USERPROFILE']
       else
         File.expand_path("~")
       end.gsub(%r{(\\|/)+$}, "")

def sym(linkable, target)
  target   = target.gsub("~", HOME)
  target   = File.expand_path(target)
  linkable = File.expand_path(linkable)

  if is_windows?
    `cmd /C mklink "#{target}" "#{linkable}"`
  else
    `ln -s "#{linkable}" "#{target}"`
  end
end

task :install_basic do
  linkables = Dir.glob('*/**{.symlink}')
  linkables << "bin" # special case

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    skip = false
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink')[0]
    target =
      if file == "bin"
        "#{HOME}/bin"
      else
        "#{HOME}/.#{file}"
      end

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then skip = true
        end
      end
    end

    FileUtils.rm_rf(target) if overwrite || overwrite_all
    FileUtils.mv(File.join(HOME, ".#{file}"), File.join(HOME, ".#{file}.backup")) if backup || backup_all

    unless skip || skip_all
      puts "#{target.gsub(HOME, "~")} => #{linkable}"
      sym(File.join(TOPLEVEL, linkable), target)
    end
  end
end

task :install_sublime do
  next unless sublime_installed?

  FileUtils.rm_rf(sublime_installed_packages) if File.exist?(sublime_installed_packages)
  FileUtils.rm_rf(sublime_user_prefs) if File.exist?(sublime_user_prefs)

  sym("./sublime/user/Preferences.sublime-settings", sublime_user_prefs)
  sym("./sublime/packages", sublime_installed_packages)
end

desc "Hook our dotfiles into system-standard positions."
task :install => [:install_basic, :install_sublime]
#task :install => :install_sublime

task :default => 'install'
