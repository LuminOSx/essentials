#colors
R='\033[1;31m'
B='\033[1;34m'
C='\033[0;36m'
G='\033[1;32m'
W='\033[1;37m'
Y='\033[1;33m'

DIR="$(pwd)"

PACKAGES=("yay" "plymouth" "gamemode")

## Cloning AUR Packages
echo -e $Y" [*] Updating AUR Packages - "$C
echo
git submodule update

## Building AUR Packages
mkdir -p $DIR/localrepo/i686 $DIR/localrepo/x86_64

echo -e $Y" [*] Building AUR Packages - "$C
echo

for PKG in ${PACKAGES[@]}; do
  echo -e $Y" [*] Building $PKG - "$C
  cd $PKG && makepkg -s
  mv *.pkg.tar.xz ../localrepo/x86_64
  cd $DIR
done

echo
echo -e $G" [*] All Packages Builted Successfully."$C
echo

## Setting up LocalRepo
cd $DIR/localrepo/x86_64
echo -e $Y" [*] Setting Up Local Repository - "$C
echo

repo-add essentials.db.tar.gz plymouth*.pkg.tar.xz yay*.pkg.tar.xz gamemode*.pkg.tar.xz
