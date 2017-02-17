## mattryan does dotfiles

A grossly opinionated set of system configurations, specific to UNIX.

## install

Run this:

```sh
git clone https://github.com/mrevd/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make
```

## uninstall
```sh
cd ~/.dotfiles
make clean
```

Symlinks everything except templates to your $HOME dir. Templates are copied.

For example: `~/.gitconfig` is copied from `~/.dotfiles/git/gitconfig.template`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **topic/\*.template**: Any files ending in `*.template` get copied into
  your `$HOME`. This is so you can keep the file versioned and prepared for
  other systems while maintaining unique settings across environments.

## thanks

This project started out as a fork of
[Zach Holman](https://github.com/holman/)'s excellent
[dotfiles](http://github.com/holman/dotfiles) which at the time was a fork of
[Ryan Bates'](http://github.com/ryanb). I've been updating this set since 2012.
