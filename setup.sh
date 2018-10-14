#### Script to bootstrap a Golang workspace on OSX ####
#######################################################

# DL and Install ######################################
brew install go

# Set up directory structure ##########################
GODIR_DEFAULT="$HOME/Code/go"
echo "Location to install Go (default: $HOME/Code/go) [RETURN to use default]: "
read GODIR

if [[ -z $GODIR ]]; then
  GODIR=$GODIR_DEFAULT
  echo "Using default: $GODIR"
fi

echo "GitHub username: "
read GHUSER

echo "=> Creating directory structure at: $GODIR"
mkdir -p $GODIR
mkdir -p $GODIR/src
mkdir -p $GODIR/pkg
mkdir -p $GODIR/bin
mkdir -p $GODIR/src/github.com/$GHUSER

# Set up environment vars #############################
echo "=> Exporitng env variables"
echo "# Golang env" >> ~/.bash_profile
echo "export GOPATH=$GODIR" >> ~/.bash_profile
echo "export GOROOT=/usr/local/opt/go/libexec" >> ~/.bash_profile
echo "export GOBIN=$GODIR/bin" >> ~/.bash_profile
`source ~/.bash_profile`

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Verify installation
go get golang.org/x/tools/cmd/godoc

echo "=> Setup Complete!"
