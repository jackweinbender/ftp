# Vagrant setup for fromthepage development

## Before you install

This is my development environment for FTP, as such, this repo includes fromthepage as a submodule. It may be best to push up all of your local changes, then do a recursive clone on this repo, rather than trying to incorperate a local fromthepage repo.

Note also, **the default RAM amount is about 4 GB.** You might want to tweak that (the `mba` branch defaults to 1 GB)

### Requirements
You need [Vagrant](https://www.vagrantup.com/intro/index.html) installed. That's it. I'm using vagrant with VirtualBox on Arch Linux, but this should work on whatever setup you have. It's built on Ubuntu 16.04.

## Setup

1. Clone the repo `git clone --recurse-submodules git@github.com:jackweinbender/vagrant_fromthepage.git`
2. `cd` into the root directory of the repo and run `vagrant up` (the first time will take a while)
3. Once that's done, you can run `vagrant ssh` to access the VM.
4. While `ssh`ed into the VM, there are three main dirs, which are all sync'ed to their local counterparts:
    * `fromthepage`: the Rails app
    * `scripts`: For my test script and any other utilities I write
    * `shared`: For anything else. I keep my database dumps here. **Note:** everything in this folder is .gitignored by default. I don't want to expose database (user!) info on github.
5. From the `fromthepage` dir, run `bundle install` to setup the app.
6. A database dump that is put into the `shared` folder with a `.dmp` (or `.dmp.gz`) extension will automatically be loaded into the database upon running the `db-setup.sh` script, which will initialize the database, load the dump file, and run migrations.

## Development
Do development as normal on your local (host) OS, including all your git stuff (pushing from the VM will fail because the VM probably doesn't have a valid ssh key for github). The VM is only for running running the rails app, console, and tests.

## Testing
The `tests.sh` script runs the full test suite, including all the database resets, fixtures, and migrations. (run from the `fromthepage` dir, you'll need to run `./../scripts/tests.sh`)
