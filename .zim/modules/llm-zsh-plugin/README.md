# LLM Zsh Plugin

[![GitHub stars](https://img.shields.io/github/stars/eliyastein/llm-zsh-plugin?style=flat-square)](https://github.com/eliyastein/llm-zsh-plugin/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Zsh 5.0+](https://img.shields.io/badge/zsh-%3E%3D5.0-blue?style=flat-square)](https://www.zsh.org/)

<div align="center">
  <p><em>Supercharge your shell with LLM command completion 🚀</em></p>
</div>

A Zsh plugin providing command completion for the [LLM CLI tool](https://llm.datasette.io/) by [Simon Willison](https://simonwillison.net/). Supports all LLM commands, model names, and options with intelligent context-aware completion.

## 🚀 Features

- 🎯 Complete command-line options for all LLM commands
- 🤖 Dynamic model name completion
- 📝 Context-aware subcommand completion
- 🔧 Supports all major LLM operations:
  - `prompt` - Execute prompts
  - `chat` - Interactive chat sessions
  - `models` - Model management
  - `templates` - Template handling
  - And much more!

## 📦 Installation

### Using Oh My Zsh

1. Clone this repository:
```bash
git clone https://github.com/eliyastein/llm-zsh-plugin ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/llm
```

2. Add `llm` to your plugins in `~/.zshrc`:
```bash
plugins=(... llm)
```

3. Reload your shell:
```bash
source ~/.zshrc
```

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/eliyastein/llm-zsh-plugin ~/.zsh/llm-zsh-plugin
```

2. Source the plugin in your `~/.zshrc`:
```bash
source ~/.zsh/llm-zsh-plugin/llm.plugin.zsh
```

3. Add the completions directory to your fpath (before `compinit`):
```bash
fpath=(~/.zsh/llm-zsh-plugin/completions $fpath)
```

4. Reload your shell:
```bash
exec zsh
```

## 🎮 Usage

Just start typing an LLM command and press <kbd>Tab</kbd> to see available completions:

```bash
llm [Tab]              # Show all main commands
llm prompt -[Tab]      # Show prompt options
llm models [Tab]       # Show model subcommands
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork it
2. Create your feature branch (`git checkout -b feature/amazing`)
3. Commit your changes (`git commit -am 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing`)
5. Create a new Pull Request

## 📝 License

[MIT License](LICENSE) - feel free to use this plugin in your own projects!

---

<div align="center">
  <sub>Built with ❤️ by <a href="https://github.com/eliyastein">Eliya Stein</a></sub>
</div>
