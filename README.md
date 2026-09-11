# Sophie's wonderful Dotfiles

## Dependencies

You only need git to clone the repository. You'll need Ruby and the Rake gem to automatically install everything.

## Installation

For the install part, Ruby with the Rake gem is needed

```
git clone https://github.com/sophiedeziel/dotfiles.git ~/.dotfiles # Just cloning
cd ~/.dotfiles; rake                                           # Automatically install the dotfiles
```

If a file already exists, you will be prompted. Existing symlinks will be automatically replaced.

`~/.zshrc` is the exception: it is never symlinked. It stays a real file that
rake keeps a small block in, sourcing the `zshrc` from this repo. Anything
machine-specific can go in `~/.zshrc` around that block, and it won't end up in
git. Re-running rake rewrites the block in place instead of appending a second
one.

Once installed properly, it will check once a day if it needs to be updated and will prompt you.

