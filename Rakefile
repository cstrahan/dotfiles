require 'rake'

TOPLEVEL = File.expand_path('.')

def windows?
  ENV['OS'] =~ /windows/i
end

HOME = if windows?
         ENV['USERPROFILE']
       else
         ENV['HOME']
       end

def sym(linkable, target)
  if windows?
    `cmd /C mklink "#{target}" "#{linkable}"`
  else
    `ln -s "#{linkable}" "#{target}"`
  end
end

desc "Hook our dotfiles into system-standard positions."
task :install do
  linkables = Dir.glob('*/**{.symlink}')
  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    skip = false
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink')[0]
    target = "#{HOME}/.#{file}"

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
      puts "#{target} => #{linkable}"
      sym(File.join(TOPLEVEL, linkable), target)
    end
  end
end
task :default => 'install'
