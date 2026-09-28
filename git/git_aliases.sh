git config --global alias.s 'status' &&\
git config --global alias.c 'checkout' &&\
git config --global alias.cm 'commit -m' &&\
git config --global alias.ca 'commit --amend' &&\
git config --global alias.noci 'commit -m "[no ci]" --allow-empty -n'
git config --global alias.cempty 'commit --allow-empty -n --amend'
git config --global alias.ls 'log --pretty=format:"%C(yellow)%h%Cblue\ [%an]\ \-\ [%ad]\ %Creset%s\ %Cred%d --decorate"' &&\
git config --global alias.b 'branch --sort=-committerdate' &&\
git config --global alias.pu '!git push -u origin $(git symbolic-ref --short HEAD)' &&\
git config --global alias.du '!git diff origin/$(git symbolic-ref --short HEAD)' &&\
git config --global alias.duf '!git diff origin/$(git symbolic-ref --short HEAD) --name-only' &&\
git config --global alias.ru '!git reset --hard origin/$(git symbolic-ref --short HEAD)' &&\
git config --global alias.rc 'rebase --continue' &&\
git config --global alias.pf 'push --force-with-lease'
git config --global alias.purge '!git branch -D $(git branch | grep -E "feature|add|fix|change")'

-- gitlab
git config --global alias.ps 'push -o ci.skip' &&\
git config --global alias.psf 'push -o ci.skip --force-with-lease'