# Hidden files accessor

Creating symbolic files to hidden files

## Feature

* Written in Ruby
* Use only standard library
* Safe generation (checking before generating)

## How to use

### Generate symbolic files to corresponding hidden files

The following code generates some symbolic files under `$HOME/hidden-access`.

```sh
$ ruby main.rb --generate $HOME
```
You can change `$HOME` to any directory path.

You can also use `-g`, which is short for `--ganerate`

### Only check

By using `--check`, you can check correctness of symbolic links to be generated.

```sh
$ ruby main.rb --check $HOME
```

The output is like

```
Check: /Users/Ryo/.activator                   ->  /Users/Ryo/hidden-access/activator
Check: /Users/Ryo/.android                     ->  /Users/Ryo/hidden-access/android
Check: /Users/Ryo/.atom                        ->  /Users/Ryo/hidden-access/atom
Check: /Users/Ryo/.babel.json                  ->  /Users/Ryo/hidden-access/babel.json
Check: /Users/Ryo/.bash_history                ->  /Users/Ryo/hidden-access/bash_history
Check: /Users/Ryo/.bash_imb                    ->  /Users/Ryo/hidden-access/bash_imb
Check: /Users/Ryo/.bash_profile                ->  /Users/Ryo/hidden-access/bash_profile
Check: /Users/Ryo/.bash_profile.ghc.orig       ->  /Users/Ryo/hidden-access/bash_profile.ghc.orig
Check: /Users/Ryo/.bash_sessions               ->  /Users/Ryo/hidden-access/bash_sessions
Check: /Users/Ryo/.bashrc                      ->  /Users/Ryo/hidden-access/bashrc
Check: /Users/Ryo/.bundle                      ->  /Users/Ryo/hidden-access/bundle
Check: /Users/Ryo/.cabal                       ->  /Users/Ryo/hidden-access/cabal
Check: /Users/Ryo/.cache                       ->  /Users/Ryo/hidden-access/cache
Check: /Users/Ryo/.cargo                       ->  /Users/Ryo/hidden-access/cargo
... elided
```

You can also use `-c`, which is short for `--check`
