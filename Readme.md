# Instructions
* Start with Parrot Sec Edition
* Install Ansible
```bash
sudo apt install ansible
```

* Clone the repo
```bash
git clone --recurse-submodules -j4 https://github.com/Paliak/parrot-build
```

* Run the playbook
```bash
ansible-playboook parrot-build/main.yml
```

# Personal Changes
* Add i3 tiling manager and related configs
* Use zsh with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) and extra plugins
* More flexible burpsuite certificate installation
