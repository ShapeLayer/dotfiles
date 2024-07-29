echo "export GPG_TTY=$(tty)" >> .zshrc.env
echo "test" | gpg --clearsign
