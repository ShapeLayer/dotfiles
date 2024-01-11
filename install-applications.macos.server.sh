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

# Install Rust
brew install rustup rust
source '$HOME/.cargo/env'
rustup update

# Install utilities
brew install neofetch
brew install podman
mkdir -p $HOME/.config/containers
echo 'unqualified-search-registries=["docker.io", "quay.io"]' > $HOME/.config/containers/registries.conf

source ~/.bashrc
