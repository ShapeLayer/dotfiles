sudo apt update -y
sudo apt upgrade -y

# Install GCC
sudo apt install gcc -y

# Install Python
sudo apt install python3 python3-pip python3-setuptools -y
sh ./runtimes/python.unix.sh

# Install Node
nvm_latest=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/nvm-sh/nvm/releases/latest | awk -F/ '{ print $NF }')
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$nvm_latest/install.sh" | bash

cat ./runtimes/node | bash
sh ./runtimes/node.unix.sh

# Install Java
sudo apt install jenv
apt install openjdk@17
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bashrc
echo '  eval "$(jenv init -)"' >> ~/.bashrc
# jenv add

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source '$HOME/.cargo/env'
rustup update

# Install utilities
sudo apt install neofetch -y
sudo apt install nautilus -y

