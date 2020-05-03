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
