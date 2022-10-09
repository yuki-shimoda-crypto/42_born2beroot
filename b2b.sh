# 1
su -
localctl set-locale LANG=en.UTF-8
apt update
apt upgrade -y
apt install sudo
groupadd user42
usermod -aG sudo yshimoda
usermod -aG user42 yshimoda
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
reboot

# 2
sudo apt update
sudo apt upgrade -y
sudo apt install vim git ssh ufw libpam-pwquality gcc -y
# EDITOR=/usr/bin/vim
sudo vim /etc/default/keyboard # XKBOPTIONS="ctrl:nocaps"
# ssh
sudo vim /etc/ssh/sshd_config
#Port 4242

sudo ufw enable
sudo ufw allow 4242
sudo ufw delete allow 22/tcp

sudo vim /etc/login.defs
# man login.defs
# PASS_MAX_DAYS 30
# PASS_MIN_DAYS 2
# PASS_WARN_AGE 7
charge -l yshimoda

sudo vim /etc/pam.d/common-password
# man pam_unix
# pam_unix minlen=10
# man pam_pwquality
# pam_pwquality lcredit=-1 ucredit=-1 dcredit=-1 maxrepeat=3 usercheck=1 difok=7 enforce_for_root

# sudo hostnamectrl set-hostname test42
# # sudo vim /etc/hosts
# # 127.0.0.1 localhost
# # 127.0.0.1 test42

# man sudoers
# sudo EDITOR=vim visudo
# passwd_tries=3 #default 3
# Defaults badpass_message="A custom message"
# Defaults iolog_dir="/var/log/sudo"
# Defaults log_input
# Defaults log_output
# su
# sudoreplay /var/log/sudo/00/00/01

# tty
# tty[1-6]
# command option F[1-6]
# w 

write monitoring.sh
sudo crontab -e
*/10 * * * * /usr/local/bin/monitoring.sh


Password1234