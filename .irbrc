begin

  IS_IRON_RUBY = Module.constants.any? { |c| c.to_s == 'System' }

  # require 'rubygems'
  require 'interactive_editor'
  require 'pp'
  
  require 'irb/completion'
  ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
  
  def cls; system 'cls'; end
  
  #===================================
  # HACK: Make interactive_editor close its file handle
  # See:  https://github.com/jberkel/interactive_editor/issues/6
  if InteractiveEditor::VERSION != "0.0.6"
    puts "Dude: Check if `interactive_editor' has been fixed in version #{InteractiveEditor::VERSION}"
  end
  class InteractiveEditor
    def edit(file=nil)
      @file = if file
         FileUtils.touch(file) unless File.exist?(file)
         File.new(file)
        else
         (@file && File.exist?(@file.path)) ? @file : Tempfile.new(["irb_tempfile", ".rb"])
      end
      mtime = File.stat(@file.path).mtime
  
      args = Shellwords.shellwords(@editor) #parse @editor as arguments could be complexe
      args << @file.path
      @file.close # <------------ HACK ATTACK
      Exec.system(*args) 
  
      execute if mtime < File.stat(@file.path).mtime
    end
  end
  #===================================

  # IronRuby has some problem with Kernel::system(cmd, *args)
  if IS_IRON_RUBY
    module InteractiveEditor::Exec
      def self.system(file, *args)
        Kernel::system([file, *args].join(" ")) #or raise "error exec'ing #{file}: #{$?}"
      end
    end
  end


rescue => error
  puts "Could not load `.irbrc':"
  puts error
end
