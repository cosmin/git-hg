function git-current-branch {
    echo "`git branch | grep "*" | awk '{print $2}'`"
}

function git-hg-clone {
    HG_REMOTE=$1
    CHECKOUT=$2
    mkdir $CHECKOUT
    cd $CHECKOUT
    CURRENT_PATH=`pwd`
    git init
    hg clone -U $HG_REMOTE .git/hgcheckout
    mkdir .git/hgremote
    cd .git/hgremote
    git --bare init
    $GITEXT_HOME/fast-export/hg-fast-export.sh -r ../hgcheckout
    cd $CURRENT_PATH
    git remote add hg .git/hgremote
    git fetch hg
    git pull hg master
}

function git-hg-fetch {
    hg -R .git/hgcheckout pull
    CURRENT_PATH=`pwd`
    cd .git/hgremote
    $GITEXT_HOME/fast-export/hg-fast-export.sh
    cd $CURRENT_PATH
    git fetch hg
}

function git-hg-pull {
    current_branch=`git-current-branch`
    git-hg-fetch
    git merge hg/$current_branch
}
