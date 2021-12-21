if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Support x64 and ARM Homebrews
arch="`uname -m`"
if [[ arch -eq "arm64" ]] ; then
    alias ibrew="arch -x86_64 /usr/local/bin/brew"
    export PATH="/opt/homebrew/bin:$PATH"
    # Without this, ARM builds relying on Homebrew libraries will fail.
    export LDFLAGS="-L/opt/homebrew/lib"
    export CPPFLAGS="-I/opt/homebrew/include"
fi

export PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT  ]; then
    export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

export RBENV_ROOT="$HOME/.rbenv"
if [ -d $RBENV_ROOT ]; then
    export PATH="$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
if [ -d $NVM_DIR ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

export GOPATH="$HOME/Source/go"
if type "go" &> /dev/null; then
    export PATH="$HOME/Source/go/bin:$PATH"
fi

export CARGO_DIR="$HOME/.cargo"
if [ -d $CARGO_DIR ]; then
    export PATH="$CARGO_DIR/bin:$PATH"
fi

export FLUTTER_PATH="$HOME/.flutter"
if [ -d $FLUTTER_PATH ]; then
    export PATH="$PATH:$FLUTTER_PATH/bin"
fi

# Installing an Anaconda environment via pyenv breaks finding gettext, which
# breaks things like `git rebase`. This fixes it.
# export PATH="/usr/local/opt/gettext/bin:$PATH"
