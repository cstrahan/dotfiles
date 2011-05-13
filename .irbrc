begin

  IS_IRON_RUBY = RUBY_ENGINE == "ironruby"

  # require 'rubygems'
  require 'interactive_editor'
  require 'pp'
  
  if RUBY_PLATFORM =~ /mingw32/ && !IS_IRON_RUBY
    require 'Win32/Console/ANSI'
  elsif IS_IRON_RUBY
    require 'iron-term-ansicolor'
    
    # TOPLEVEL_BINDING#eval is screwed up in IR...
    # This is an evil hack to get interactive_editor working.
    MAIN_SELF = self
    class << TOPLEVEL_BINDING
      def eval(*args)
        MAIN_SELF
      end
    end
  end
  
  # Use blackwinter-wirble
  require 'wirble'
  Wirble.init
  Wirble.colorize unless IS_IRON_RUBY
  
  colors = Wirble::Colorize.colors.merge({
    # set the comma color to blue
    :comma => :white,
    :refers => :white,
  })
  Wirble::Colorize.colors = colors
  
  require 'irb/completion'
  ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
  
  def cls; system 'cls'; end
  
  # IronRuby has some problem with Kernel::system(cmd, *args)
  if IS_IRON_RUBY
    module InteractiveEditor::Exec
      def self.system(file, *args)
        Kernel::system([file, *args].join(" ")) #or raise "error exec'ing #{file}: #{$?}"
      end
    end
  end

rescue Exception => error
  puts "Could not load `.irbrc':"
  puts error
  puts ""
  puts "Backtrace:"
  puts error.backtrace
end
