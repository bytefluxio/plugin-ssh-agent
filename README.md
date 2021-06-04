<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

### fish-ssh-agent
> A plugin for [Oh My Fish][omf-link] to output the current working directory relative to environment variables.

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v3.2.2-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


## Install

```fish
$ omf install ssh-agent
```


## Usage

Automatically starts an ssh-agent, when you open your shell.

The ssh-agent is kept alive.

If ssh-agent can't be connected to, all running ssh-agents, that your shell sees (checked via `ps -a`) are shut down and a new one is started.

Since all shells share the ssh-agent, you only have to enter your password once.

# License

[MIT][mit] © [Robert Westman][author] et [al][contributors]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/alyyousuf7
[contributors]:   https://github.com/bytefluxio/plugin-ssh-agent/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
