loadkeys it
ls /sys/firmware/efi/efivars
ip link
dhcpcd
iwctl device list
iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl station wlan0 connect SSID
fdisk -l
chdisk /dev/sda
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mount /dev/sda3 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
swapon /dev/sda2
reflector --verbose --country Italy --sort rate --save /etc/pacman.d/mirrorlist
cat /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware nano
genfstab -U -p /mnt > /mnt/etc/fstab
arch-chroot /mnt /bin/bash
nano /etc/locale.gen
locale-gen
echo LANG=it_IT.UTF-8 > /etc/locale.conf
export LANG=it_IT.UTF-8
nano /etc/vconsole.conf
export EDITOR=nano
ln -s /usr/share/zoneinfo/Europe/Rome /etc/localtime
hwclock --systohc --utc
echo NomeMacchina > /etc/hostname
pacman -S net-tools dhcpcd netctl
systemctl enable dhcpcd
pacman -S iwd wpa_supplicant wireless_tools dialog iw
systemctl enable iwd
passwd 
useradd -m -G wheel -s /bin/bash nomeutente
passwd nomeutente
visudo
pacman -S grub
pacman -S efibootmgr
pacman -S os-prober
grub-install
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
reboot
iwctl device list ip linkiwctl station wlan0 get-networks iwctl station wlan0 scan iwctl station wlan0 connect SSID
pacman -S alsa-utils
pacman -S xorg-server xorg-xinit
pacman -S networkmanager
systemctl enable NetworkManager
systemctl disable dhcpcd
