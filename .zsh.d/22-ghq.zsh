# ghq create

function ghq-new() {
    local REPONAME=$1

    if [ -z "$REPONAME" ]; then
        echo 'Repository name must be specified.'
        return
    fi

    local TMPDIR=/tmp/ghq_new
    local TMPREPODIR=$TMPDIR/$REPONAME

    mkdir -p $TMPREPODIR
    cd $TMPREPODIR

    hub init
    hub create $REPONAME -p

    local REPOURL=$(git remote get-url origin)
    local REPOPATH=$(echo $REPOURL | sed -e 's/^https:\/\///' -e 's/^git@//' -e 's/\.git$//' -e 's/github.com:/github.com\//')
    local USER_REPO_NAME=$(echo $REPOPATH | sed -e 's/^github\.com\///')

    ghq get git@github.com:$USER_REPO_NAME

    cd $(ghq root)/$REPOPATH

    rm -rf $TMPREPODIR
}