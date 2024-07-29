gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
gpg --armor --export [keyid]
git config --global commit.gpgsign true
