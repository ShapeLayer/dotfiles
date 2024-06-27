brew install iterm2

sh iterm2.icon.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc.env
echo "source ~/.zshrc.env" >> ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Change
# ZSH_THEME="powerlevel10k/powerlevel10k"
vi ~/.zshrc
exec zsh
