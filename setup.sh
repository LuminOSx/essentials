#colors
R='\033[1;31m'
B='\033[1;34m'
C='\033[0;36m'
G='\033[1;32m'
W='\033[1;37m'
Y='\033[1;33m'

DIR="$(pwd)"
PR10="yay"
PR11="plymouth"

## Banner
echo
echo -e $B" ┌──────────────────────────────────┐"
echo -e $B" │   $R┏━┓┏━┓┏━╸╻ ╻   ╻  ╻┏┓╻╻ ╻╻ ╻   $B│"
echo -e $B" │   $R┣━┫┣┳┛┃  ┣━┫   ┃  ┃┃┗┫┃ ┃┏╋┛   $B│"
echo -e $B" │   $R╹ ╹╹┗╸┗━╸╹ ╹   ┗━╸╹╹ ╹┗━┛╹ ╹   $B│"
echo -e $B" └──────────────────────────────────┘"
echo -e $W"  By:$C Aditya Shakya"
echo -e $W"  Github:$C @adi1090x"
echo -e $W"  Reddit:$C @adi1090x"
echo

## Setting Things Up
echo
echo -e $Y" [*] Installing Dependencies - "$C
echo
sudo pacman -Sy git archiso --noconfirm
echo
echo -e $G" [*] Succesfully Installed."$C
echo
echo -e $Y" [*] Modifying /usr/bin/mkarchiso - "$C
sudo cp /usr/bin/mkarchiso{,.bak} && sudo sed -i -e 's/-c -G -M/-i -c -G -M/g' /usr/bin/mkarchiso
echo
echo -e $G" [*] Succesfully Modified."$C
echo

## Cloning AUR Packages
cd $DIR/pkgs

echo -e $Y" [*] Downloading AUR Packages - "$C
echo
echo -e $Y" [*] Cloning aurafetch-git - "$C
git clone https://aur.archlinux.org/aurafetch-git.git --depth 1 $PR1
echo
echo -e $Y" [*] Cloning compton-tryone-git - "$C
git clone https://aur.archlinux.org/compton-tryone-git.git --depth 1 $PR2
echo
echo -e $Y" [*] Cloning i3lock-fancier-git - "$C
git clone https://aur.archlinux.org/i3lock-fancier-git.git --depth 1 $PR3
echo
echo -e $Y" [*] Cloning ksuperkey - "$C
git clone https://aur.archlinux.org/ksuperkey.git --depth 1 $PR4
echo
echo -e $Y" [*] Cloning networkmanager-dmenu-git - "$C
git clone https://aur.archlinux.org/networkmanager-dmenu-git.git --depth 1 $PR5
echo
#echo -e $Y" [*] Cloning obmenu-generator - "$C
#git clone https://aur.archlinux.org/obmenu-generator.git --depth 1 $PR6
#echo
echo -e $Y" [*] Cloning perl-linux-desktopfiles - "$C
git clone https://aur.archlinux.org/perl-linux-desktopfiles.git --depth 1 $PR7
echo
#echo -e $Y" [*] Cloning polybar - "$C
#git clone https://aur.archlinux.org/polybar.git --depth 1 $PR8
#echo
echo -e $Y" [*] Cloning rxvt-unicode-pixbuf - "$C
git clone https://aur.archlinux.org/rxvt-unicode-pixbuf.git --depth 1 $PR9
echo
echo -e $Y" [*] Cloning yay - "$C
git clone https://aur.archlinux.org/yay.git --depth 1 $PR10
echo
echo -e $G" [*] Downloaded Successfully."$C
echo

## Building AUR Packages
mkdir -p ../localrepo/i686 ../localrepo/x86_64

echo -e $Y" [*] Building AUR Packages - "$C
echo
echo -e $Y" [*] Building $PR1 - "$C
cd $PR1 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR2 - "$C
cd $PR2 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR3 - "$C
cd $PR3 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR4 - "$C
cd $PR4 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR5 - "$C
cd $PR5 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR6 - "$C
cd $PR6 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR7 - "$C
cd $PR7 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR8 - "$C
cd $PR8 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR9 - "$C
cd $PR9 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR10 - "$C
cd $PR10 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd ..

echo -e $Y" [*] Building $PR11 - "$C
cd $PR11 && makepkg -s
mv *.pkg.tar.xz ../../localrepo/x86_64
cd .. && cd ..

echo
echo -e $G" [*] All Packages Builted Successfully."$C
echo

## Setting up LocalRepo
cd $DIR/localrepo/x86_64
echo -e $Y" [*] Setting Up Local Repository - "$C
echo

repo-add essentials.db.tar.gz plymouth*.pkg.tar.xz yay*.pkg.tar.xz
