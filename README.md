# Vagrant file for *fromthepage* development

## Before you install

This is my development environment for FTP, as such, this repo includes fromthepage as a submodule. It may be best to push up all of your local changes, then do a recursive clone on theis repo, rather than trying to incorperate your local fromthepage repo.

Note also, **the default RAM amount is about 4 GB.** You might want to tweak that (the `mba` branch defaults to 1 GB)

### Requirements
You need [Vagrant](https://www.vagrantup.com/intro/index.html) installed. That's it. I'm using vagrant with VirtualBox, but this should work on whatever setup you have.

## Setup

1. Clone the repo `git clone --recurse-submodules git@github.com:jackweinbender/vagrant_fromthepage.git`
2. `cd` into the root directory of the repo and run `vagrant up` (the first time will take a while)
3. Once that's done, you can run `vagrant ssh` to access the VM.
4. While `ssh`ed into the VM, there are three main dirs:
    * `fromthepage`: the Rails app)
    * `scripts`: For my test script and any other utilities I write
    * `shared`: For anything else. I keep my DB dumps there. Note: everything in this folder is .gitignored by default. We don't want to expose DB info on github.
5. From the `fromthepage` dir, run `bundle install` to setup the app
6. If you put a database dump in the `shared` folder with the `.dmp` (or `.dmp.gz`) extension, you can run the `db-setup.sh` script, which will initialize your database, load the dump file, and run your migrations.

## Development
You should do development as normal on your local (host) OS, including all your git stuff. The VM is only for running running the rails app, console, and tests.

## Testing
You can run the `tests.sh` script to run the full test suite. (from the `fromthepage` dir, you'll need to run `./../scripts/tests.sh`
