gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
gpg --armor --export [keyid]
git config --global commit.gpgsign true
git config --global user.signingkey [keyid]
git config --global tag.pgpsign true
git config --global program [pgppath]
