xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew install wget
cp ./system.unix/.aliases ~/
echo source ~/.aliases >> ~/.bashrc

# Install GCC
brew install gcc

# Install Python
# brew install python3
brew upgrade python3
sh ./runtimes/python.unix.sh

# Install Node
brew install nvm
cat ./runtimes/node | bash
sh ./runtimes/node.unix.sh

# Install Java
brew install jenv
brew install openjdk@17
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo '  eval "$(jenv init -)"' >> ~/.zshrc
jenv add /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home

# Install Rust
brew install rustup rust
source "$HOME/.cargo/env"
rustup update

# Install utilities
brew install neofetch

source ~/.bashrc
