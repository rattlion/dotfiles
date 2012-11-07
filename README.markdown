## mattryan does dotfiles holman style

Endless tweaking of the stupidest things. Not really. Actually, the best shit ever.

## install

Run this:

```sh
git clone https://github.com/mattryan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake install
```

Symlinks erring thang to your $HOME dir.

Edit this `zsh/zshrc.symlink`.

Update this `git/gitconfig.symlink`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.
- **topic/\*.completion.zsh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up zsh autocomplete functions.

## thanks

I forked [Zach Holman](https://github.com/holman/)'s excellent
[dotfiles](http://github.com/holman/dotfiles) and am rolling out my own
config.
