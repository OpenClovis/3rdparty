3rdparty
========

Third party packages necessary for installing SAFplus platform

* Note for download
Because some packages are too large and exceed GitHub's limits, it is necessary to use git LFS to store large packages:
1. How to install git lfs
sudo apt install git-lfs
git lfs install

2. How to use git lfs for commit
git lfs track "*.zip"
git lfs track "*.tar.gz"
git add packages.zip
git add packages.tar.gz
git commit -m "message for example"
git push origin

3. How to use git lfs for pull
git lfs pull

4. When a Git repository contains both LFS-managed files and normal Git files
git pull
git lfs pull

