# Hidden files accessor

Creating symbolic files to hidden files

## How to use

### Generate symbolic files to hiddens

The following code generate some symbolic files under `$HOME/hidden-access`.

```sh
$ ruby main.rb --generate $HOME
```
You can change `$HOME` to any directory path.

You can alos use `-g`, which is short for `--ganerate`

### Only check

```sh
$ ruby main.rb --check $HOME
```

You can alos use `-c`, which is short for `--check`


## Feature

* Written in Ruby
* Use only standard library
* Checking before generating
