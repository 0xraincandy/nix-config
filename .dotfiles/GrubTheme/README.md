This is a Grub theme with Alya

To install first clone the repository
```
git clone https://github.com/0xraincandy/GrubTheme.git
```
then copy the repository to this directory
```
sudo cp -r GrubTheme /usr/share/grub/themes
```
after this modify the grub config file
```
sudo nano /etc/default/grub

sudo vim /etc/default/grub

sudo nvim /etc/default/grub
```
add this line
```
GRUB_THEME="/usr/share/grub/themes/GrubTheme/theme.txt"
```
lastly update grub
```
sudo grub-mkconfig -o /boot/grub/grub.cfg  
```
