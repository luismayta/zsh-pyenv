<!--


  ** DO NOT EDIT THIS FILE
  **
  ** 1) Make all changes to `README.yaml`
  ** 2) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **


  -->

# zsh-pyenv

[![Build Status](https://travis-ci.org/luismayta/zsh-pyenv.svg?branch=main)](https://travis-ci.org/luismayta/zsh-pyenv) [![Issues](https://img.shields.io/github/issues/luismayta/zsh-pyenv.svg)](https://github.com/luismayta/zsh-pyenv/issues) [![Latest Release](https://img.shields.io/github/release/luismayta/zsh-pyenv.svg)](https://travis-ci.org/luismayta/zsh-pyenv/releases)

zsh-pyenv plugin for zsh.

---

This project is part of our comprehensive [hadenlabs](https://hadenlabs.com) plugins of zsh.

It's 100% Open Source and licensed under the [MIT](LICENSE).

## Requirements

This is a list of plugins that need to be installed previously to enjoy all the goodies of this configuration:

```{.sourceCode .bash}
https://github.com/luismayta/zsh-core
https://github.com/luismayta/zsh-notify
https://github.com/luismayta/zsh-functions
```

## Installation

### [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) users

If you're using [oh-my-zsh](https://gitub.com/robbyrussell/oh-my-zsh), install this plugin by doing the following:

1.  Go to your oh-my-zsh custom plugins directory -`cd ~/.oh-my-zsh/custom/plugins`
2.  Clone the plugin `bash git clone https://github.com/luismayta/zsh-pyenv`bash
3.  Edit your `.zshrc` and add `plugins=( ... zsh-pyenv )` to your list of plugins
4.  Open a new terminal and enjoy!

### [antigen](https://github.com/zsh-users/antigen) users

If you're using [Antigen](https://github.com/zsh-lovers/antigen), install this plugin by doing the following:

1.  Add `antigen bundle luismayta/zsh-pyenv` to your `.zshrc` where you're adding your other plugins.
2.  Either open a new terminal to force zsh to load the new plugin, or run `antigen bundle luismayta/zsh-pyenv` in a running zsh session.
3.  Enjoy!

### [antibody](https://github.com/getantibody/antibody) users

If you're using [Antigen](https://github.com/getantibody/antibody), install this plugin by doing the following:

1.  Add :

```{.sourceCode .bash}
     antibody bundle luismayta/zsh-pyenv
```

to your `.zshrc` where you're adding your other plugins.

2.  Either open a new terminal to force zsh to load the new plugin, or run `antibody bundle luismayta/zsh-pyenv` in a running zsh session.
3.  Enjoy!

## Usage

```bash

  make setup

```

## Help

**Got a question?**

File a GitHub [issue](https://github.com/luismayta/zsh-pyenv/issues), send us an [email][email] or join our [Slack Community][slack].

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/luismayta/zsh-pyenv/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://hadenlabs.com) with our other projects, we would love to hear from you! Shoot us an [email](mailto:support@hadenlabs.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

1.  **Fork** the repo on GitHub
2.  **Clone** the project to your own machine
3.  **Commit** changes to your own branch
4.  **Push** your work back up to your fork
5.  Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to rebase the latest changes from "upstream" before making a pull request!

### Versioning

Releases are managed using github release feature. We use \[Semantic Versioning\](<http://semver.org>) for all the releases. Every change made to the code base will be referred to in the release notes (except for cleanups and refactorings).

## Copyright

Copyright © 2018-2021 [Hadenlabs](https://hadenlabs.com)

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Source: <https://opensource.org/licenses/MIT>

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Hadenlabs][https://hadenlabs.com]. Like it? Please let us know at <support@hadenlabs.com>

### Contributors

| [![Luis Mayta][luismayta_avatar]][luismayta_homepage]<br/>[Luis Mayta][luismayta_homepage] |
| ------------------------------------------------------------------------------------------ |

[luismayta_homepage]: https://github.com/luismayta
[luismayta_avatar]: https://github.com/luismayta.png?size=150
