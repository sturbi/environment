# fish shell
## REHL 7
https://software.opensuse.org/download.html?project=shells%3Afish%3Arelease%3A3&package=fish
## install fish
```
cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:fish:release:3/RHEL_7/shells:fish:release:3.repo
```
## install omf
```
curl -L https://get.oh-my.fish | fish
```
## customization
### agnoster
```
omf install agnoster
```
### prompt lenght
```
set -U fish_prompt_pwd_dir_length 0
```
