# Credit: https://github.com/henrik/dotfiles/

DO_NOT_SYMLINK = %w[
  .gitignore
  .secrets.example
  extras
  Rakefile
  README.md
  zsh-themes
  zshrc
]

ZSHRC_BLOCK_START = "# >>> sophie's dotfiles >>>"
ZSHRC_BLOCK_END = "# <<< sophie's dotfiles <<<"


def error(text)
  STDERR.puts "!  #{text}"
end

def info(text)
  STDOUT.puts "*  #{text}"
end

def info_rm(text)
  STDOUT.puts "x  #{text}"
end

# Write $HOME rather than the expanded path, so the line works on any machine.
# Both sides get resolved first: Dir.pwd hands us a realpath, while a home like
# /tmp/x (-> /private/tmp/x) does not, and the prefix check would miss.
def home_relative(path)
  home = File.realpath(File.expand_path("~"))
  full = File.realpath(path)
  full.start_with?("#{home}/") ? full.sub(home, "$HOME") : full
end

# ~/.zshrc stays a real, machine-local file. We only manage a small block in it
# that sources the zshrc from this repo, so machine-specific config can live
# alongside it without ending up in git.
def install_zshrc
  source = File.join(Dir.pwd, "zshrc")
  target = File.expand_path("~/.zshrc")

  if File.symlink?(target)
    info_rm "Removing symlink #{target} --> #{File.readlink(target)}"
    FileUtils.rm(target)
  end

  path = home_relative(source)
  line = %([ -f "#{path}" ] && source "#{path}")
  block = "#{ZSHRC_BLOCK_START}\n#{line}\n#{ZSHRC_BLOCK_END}\n"
  managed = /^#{Regexp.escape(ZSHRC_BLOCK_START)}$.*?^#{Regexp.escape(ZSHRC_BLOCK_END)}$\n?/m

  contents = File.exist?(target) ? File.read(target) : ""

  if contents.match?(managed)
    updated = contents.sub(managed, block)
    if updated == contents
      info "Already sourcing #{source} from #{target}"
    else
      File.write(target, updated)
      info "Updating source block: #{target} --> #{source}"
    end
  else
    contents = contents.sub(/\n*\z/, "\n\n") unless contents.empty?
    File.write(target, contents + block)
    info "Adding source block: #{target} --> #{source}"
  end
end

task :default => :install

desc "Install dotfiles."
task :install do
  Dir["*"].each do |file|
    source = File.join(Dir.pwd, file)
    basename = File.basename(source)
    next if DO_NOT_SYMLINK.include?(basename)

    target = File.expand_path("~/.#{basename}")

    if File.symlink?(target)
      symlink_to = File.readlink(target)
      info_rm "Removing symlink #{target} --> #{symlink_to}" if symlink_to != source
      FileUtils.rm(target)
    elsif File.exist?(target)
      error "#{target} exists. Will not automatically overwrite a non-symlink. Overwrite (y/n)?"
      print "? "
      if STDIN.gets.match(/^y/i)
        info_rm "Removing #{target}."
        FileUtils.rm_rf(target)
      else
        next
      end
    end

    FileUtils.ln_s(source, target)
    info "Creating symlink: #{target} --> #{source}"
  end

  install_zshrc

  target = File.expand_path("~/.oh-my-zsh/themes/doubleend.zsh-theme")
  source = File.join(Dir.pwd, "zsh-themes/doubleend.zsh-theme")
  FileUtils.rm_rf(target)
  FileUtils.ln_s(source, target)
    info "Creating symlink: #{target} --> #{source}"

  system "git submodule update --init"
end
