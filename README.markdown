# git-hg #

*Description*: A set of scripts for checking out and tracking a mercurial project
from git. Push supported added as well although it is still experimental.

*Author*: Cosmin Stejerean (offbytwo)

*License*: MIT

## Dependencies ##

Mercurial (`hg`) and python must be installed and in your `$PATH`.

If this is a fresh checkout run

    $ git submodule update --init

to pull in fast-export. If for some reason you cannot do this
get a copy of fast-export from http://repo.or.cz/w/fast-export.git and
place it in the root of the checkout.

## Installation ##

Either add `/path/to/this/checkout/bin` to your `$PATH`, or symbolic link
`/path/to/this/checkout/bin/git-hg` into a directory on your `$PATH`.

## Usage ##

- Clone an hg repo, including ones over HTTP:

        $ git-hg clone http://some/random/hg/repo [local-git-repo-name]

- Fetch updates from the hg repo:

        $ git-hg fetch

  or optionally:

        $ git-hg pull # same as git-hg-fetch && git merge hg/branch_name

- Checkout a new branch from hg:

        $ git-hg checkout branch_name

## Structure ##

`.git/hgcheckout` - contains a bare mercurial checkout of the specified repo

`.git/hgremote` - contains a bare git repo clones from the mercurial one, this
                  is added as a remote called "hg" in the base repo