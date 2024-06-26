name="android-studio-canary"
gives="android-studio"
repology=("project: ${gives}")
replace=("${gives}-beta" "${gives}" "${name}")
pkgver="2023.1.1.28"
url="https://dl.google.com/dl/android/studio/ide-zips/${pkgver}/${gives}-${pkgver}-linux.tar.gz"
depends=("libc6-i386" "lib32ncurses6" "lib32stdc++6" "lib32z1" "libbz2-1.0:i386")
pkgdesc="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development"
hash="139d0dbb4909353b68fbf55c09b6d31a34512044a9d4f02ce0f1a9accca128f9"
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  # Moving all android studio files to /opt
  sudo install -d "${pkgdir}/opt/${gives}"
  sudo cp -a bin lib jbr plugins license LICENSE.txt build.txt product-info.json "${pkgdir}/opt/${gives}"

  # Creating a launcher in $PATH
  sudo install -d "${pkgdir}/usr/bin"

  sudo install -d "${pkgdir}/usr/share/applications"
  sudo wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${gives}/${gives}.desktop" -O "${pkgdir}//usr/share/applications/${gives}.desktop"

  sudo install -Dm644 bin/studio.png "${pkgdir}/usr/share/pixmaps/${gives}.png"
  sudo chmod -R ugo+rX "${pkgdir}/opt"
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo ln -sf "/opt/${gives}/bin/studio.sh" "${pkgdir}/usr/bin/${gives}"
}

post_install() {

  sudo update-desktop-database -q
  # Finished installation
  fancy_message info "Finished installation. Please start Android Studio to configure it!"
}

post_remove() {
  sudo update-desktop-database -q
}
