#!/usr/bin/env ruby

# This is an incredibly hacky POC.

require 'open-uri'
require 'json'
require 'tmpdir'
require 'io/console'

$plugins = []
print "GitHub User: "
user = STDIN.gets.chomp
print "Password: "
pass = STDIN.noecho(&:gets).chomp
$basic_auth = [user, pass]

def plugin(name, url)
  owner = url[/https?:\/\/github.com\/([^\/]+)\/.*/, 1]
  repo = url[/https?:\/\/github.com\/[^\/]+\/([^\/]+)\.git.*/, 1]
  ref_obj = JSON.parse(open("https://api.github.com/repos/#{owner}/#{repo}/git/refs/heads/master",
                            :http_basic_authentication => $basic_auth,
                            &:read))
  sha = ref_obj["object"]["sha"]
  plugin = {
    :name => name,
    :owner => owner,
    :repo => repo,
    :rev => sha
  }
  puts plugin.inspect
  $plugins << plugin
end

def calculate_sha256(plugin)
  owner, repo, rev = plugin[:owner], plugin[:repo], plugin[:rev]
  `nix-prefetch-zip --name #{repo}-#{rev}-src http://github.com/#{owner}/#{repo}/archive/#{rev}.tar.gz`.chomp
end

def to_nix(plugins)
  nix_src = <<-CODE
{ fetchFromGitHub }:
{
CODE
  plugins.each do |plugin|
    nix_src << <<-CODE
  #{plugin[:name]} = fetchFromGitHub {
    owner  = "#{plugin[:owner]}";
    repo   = "#{plugin[:repo]}";
    rev    = "#{plugin[:rev]}";
    sha256 = "#{plugin[:sha256]}";
  };
CODE
  end
  nix_src << "}"

  nix_src
end

def get_key(plugin)
  plugin[:owner]+"/"+plugin[:repo]+"/"+plugin[:rev]
end

def process!
  # create sha256 cache/lookup
  sha_lookup = {}
  old_plugins = JSON.parse(s, :symbolize_names => true) rescue []
  old_plugins.each do |plugin|
    sha_lookup[get_key(plugin)] = plugin[:sha256]
  end

  # calculate sha256s
  $plugins.each do |plugin|
    plugin[:sha256] = sha_lookup[get_key(plugin)] || calculate_sha256(plugin)
  end

  $plugins = $plugins.sort_by {|p| p[:name]}

  # write nix
  File.open("sources.nix", "w") do |f|
    nix_src = to_nix($plugins)
    f.write(nix_src)
  end

  # dump json
  File.open("sources.json", "w") do |f|
    json = JSON.pretty_generate($plugins)
    f.write(json)
  end
end

plugin "pathogen", "https://github.com/tpope/vim-pathogen.git"

plugin "vinarise", "https://github.com/Shougo/vinarise.vim.git"

#plugin "vim-lion", "https://github.com/tommcdo/vim-lion.git"
plugin "vim-exchange", "https://github.com/tommcdo/vim-exchange.git"

plugin "ctrlp", "https://github.com/kien/ctrlp.vim.git"
plugin "command-t", "https://github.com/wincent/Command-T.git"
plugin "nerdtree", "https://github.com/scrooloose/nerdtree.git"
plugin "ack", "https://github.com/mileszs/ack.vim.git"
plugin "ag", "https://github.com/rking/ag.vim.git"
plugin "autotag", "https://github.com/vim-scripts/AutoTag.git"
plugin "eunuch", "https://github.com/tpope/vim-eunuch.git"
plugin "dispatch", "https://github.com/tpope/vim-dispatch.git"
plugin "scratch", "https://github.com/vim-scripts/scratch.vim.git"
plugin "vimwiki", "https://github.com/vimwiki/vimwiki.git"
plugin "voom", "https://github.com/vim-scripts/VOoM.git"

plugin "solarized", "https://github.com/altercation/vim-colors-solarized.git"
plugin "tomorrow-night", "https://github.com/chriskempson/vim-tomorrow-theme.git"
plugin "base16", "https://github.com/chriskempson/base16-vim.git"
plugin "jellybeans", "https://github.com/nanotech/jellybeans.vim.git"
plugin "jellyx", "https://github.com/guns/jellyx.vim.git"
plugin "hybrid", "https://github.com/w0ng/vim-hybrid.git"
plugin "xoria256", "https://github.com/vim-scripts/xoria256.vim.git"

plugin "nerdcommenter", "https://github.com/scrooloose/nerdcommenter.git"
plugin "surround", "https://github.com/tpope/vim-surround.git"
plugin "endwise", "https://github.com/tpope/vim-endwise.git"
plugin "matchit", "https://github.com/edsono/vim-matchit.git"
plugin "matchtag", "https://github.com/gregsexton/MatchTag.git"
plugin "vim-css-color", "https://github.com/ap/vim-css-color.git"
plugin "vim-repeat", "https://github.com/tpope/vim-repeat.git"
plugin "vim-indent-object", "https://github.com/michaeljsmith/vim-indent-object.git"
plugin "unimpaired", "https://github.com/tpope/vim-unimpaired.git"
plugin "syntastic", "https://github.com/scrooloose/syntastic.git"
plugin "tabmerge", "https://github.com/vim-scripts/tabmerge.git"
plugin "tabular", "https://github.com/godlygeek/tabular.git"
plugin "align", "https://github.com/tsaleh/vim-align.git"
plugin "ultisnips", "https://github.com/SirVer/ultisnips.git" # requires separate snippets
plugin "vim-snippets", "https://github.com/honza/vim-snippets.git" # the actual snippets to be used with a snippet engine like UltiSnips
#plugin "vim-snipmate", "https://github.com/garbas/vim-snipmate.git" # competitor to UltiSnips
plugin "tlib", "https://github.com/tomtom/tlib_vim.git"
plugin "addon-mw-utils", "https://github.com/MarcWeber/vim-addon-mw-utils.git"
#plugin "neocomplcache", "https://github.com/Shougo/neocomplcache.vim.git"
#plugin "youcompleteme", "https://github.com/Valloric/YouCompleteMe.git"
plugin "vimproc", "https://github.com/Shougo/vimproc.vim.git"

plugin "vim-ruby", "https://github.com/vim-ruby/vim-ruby.git"
plugin "vim-vroom", "https://github.com/skalnik/vim-vroom.git"
plugin "switch", "http://github.com/AndrewRadev/switch.vim.git"
plugin "vim-ragtag", "https://github.com/tpope/vim-ragtag.git"
#plugin "omnisharp", "https://github.com/nosami/Omnisharp.git" # need to patch the logging path

plugin "alternate", "https://github.com/vim-scripts/a.vim.git"
plugin "headerguard", "https://github.com/vim-scripts/headerguard.vim.git"

#plugin "vim-polyglot", "https://github.com/sheerun/vim-polyglot.git"
plugin "nginx-vim-syntax", "https://github.com/evanmiller/nginx-vim-syntax.git"
plugin "haml", "https://github.com/tpope/vim-haml.git"
plugin "slim", "https://github.com/slim-template/vim-slim.git"
plugin "scss", "https://github.com/cakebaker/scss-syntax.vim.git"
plugin "less", "https://github.com/groenewege/vim-less.git"
plugin "html5", "http://github.com/othree/html5.vim.git"
plugin "nodejs", "https://github.com/mmalecki/vim-node.js.git"
#plugin "javascript", "https://github.com/pangloss/vim-javascript.git"
#plugin "JavaScript-Indent", "https://github.com/vim-scripts/JavaScript-Indent.git"
#plugin "vim-javascript-syntax", "https://github.com/jelera/vim-javascript-syntax"
plugin "jasmine", "https://github.com/claco/jasmine.vim.git"
# seems to cause problems (garbage characters):
#plugin "jshint", "https://github.com/wookiehangover/jshint.vim.git"
plugin "liquid", "https://github.com/tpope/vim-liquid.git"
plugin "markdown", "https://github.com/tpope/vim-markdown.git"
plugin "textile", "https://github.com/timcharper/textile.vim.git"
plugin "puppet", "https://github.com/ajf/puppet-vim.git"
plugin "rake", "https://github.com/tpope/vim-rake.git"
plugin "bundler", "https://github.com/tpope/vim-bundler.git"
plugin "rails", "https://github.com/tpope/vim-rails.git"
plugin "rspec", "https://github.com/thoughtbot/vim-rspec.git"
plugin "cucumber", "https://github.com/tpope/vim-cucumber.git"
plugin "minitest", "https://github.com/sunaku/vim-ruby-minitest.git"
plugin "vimerl", "https://github.com/jimenezrick/vimerl.git"
plugin "elixer", "https://github.com/elixir-lang/vim-elixir.git"
plugin "elixer-snippets", "https://github.com/carlosgaldino/elixir-snippets.git"
plugin "scala", "https://github.com/derekwyatt/vim-scala.git"
plugin "sinatra", "https://github.com/hallison/vim-ruby-sinatra.git"
plugin "coffeescript", "https://github.com/AndrewRadev/vim-coffee-script.git"
plugin "vim-ls", "https://github.com/gkz/vim-ls.git"
plugin "handlebars", "https://github.com/nono/vim-handlebars.git"
plugin "mustache", "https://github.com/juvenn/mustache.vim.git"
plugin "nimrod", "https://github.com/zah/nimrod.vim.git"
plugin "rust", "https://github.com/wting/rust.vim.git"
plugin "eclim", "https://github.com/cstrahan/vim-eclim.git"
plugin "capnp", "https://github.com/cstrahan/vim-capnp.git"
plugin "dockerfile", "https://github.com/ekalinin/Dockerfile.vim.git"
plugin "vim-go", "https://github.com/fatih/vim-go.git"
#plugin "vim-gocode", "https://github.com/Blackrush/vim-gocode.git"

#plugin "sparkup", "https://github.com/rstacruz/sparkup.git"
#plugin "emmet", "https://github.com/mattn/emmet-vim.git"

plugin "vim-classpath", "https://github.com/tpope/vim-classpath.git"
plugin "vim-clojure-static", "https://github.com/guns/vim-clojure-static.git"
plugin "vim-fireplace", "https://github.com/tpope/vim-fireplace.git"
plugin "vim-redl", "https://github.com/dgrnbrg/vim-redl.git"
plugin "vim-sexp", "https://github.com/guns/vim-sexp.git"
plugin "vim-sexp-mappings-for-regular-people", "https://github.com/tpope/vim-sexp-mappings-for-regular-people.git"

#plugin "haskell-indent", "https://github.com/vim-scripts/indenthaskell.vim.git"
plugin "html-template-syntax", "https://github.com/pbrisbin/vim-syntax-shakespeare.git"
plugin "hasksyn", "https://github.com/zkf/hasksyn.git"
plugin "ghcmod", "https://github.com/eagletmt/ghcmod-vim.git"
plugin "vim-hdevtools", "https://github.com/bitc/vim-hdevtools.git" # supposedly faster than ghcmod
plugin "neco-ghc", "https://github.com/eagletmt/neco-ghc.git"

plugin "latex-box", "https://github.com/LaTeX-Box-Team/LaTeX-Box.git"

# tmux/iTerm2 support
#let g:vitality_fix_focus = 1
#let g:vitality_fix_cursor = 1
#let g:vitality_always_assume_iterm = 1
plugin "vitality", "https://github.com/aaronjensen/vitality.vim.git"

# readline style insertion
plugin "vim-rsi", "https://github.com/tpope/vim-rsi.git"

plugin "fugitive", "https://github.com/tpope/vim-fugitive.git"
plugin "vim-git", "https://github.com/tpope/vim-git.git"

# Doesn't work on Linux
#plugin "copy-as-rtf", "https://github.com/zerowidth/vim-copy-as-rtf.git"

plugin "vim-indexed-search", "https://github.com/henrik/vim-indexed-search.git"

process!
