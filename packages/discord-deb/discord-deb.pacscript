name="discord-deb"
gives="discord"
breaks=("${gives}" "${gives}-app" "${gives}-debian-patched-deb")
pkgver="0.0.50"
pkgdesc="Chat for Communities and Friends. Discord is the easiest way to communicate over voice, video, and text. Chat, hang out, and stay close with your friends and communities"
hash="36d201fa54405323aca8f6d1070dfd157783a4de84b925880bca2ff4d3bf225f"
maintainer="ObsidianPresidium <emil@aarestrup.nu>"
arch=('amd64')
url="https://dl.discordapp.net/apps/linux/${pkgver}/discord-${pkgver}.deb"
homepage='https://discord.com/'
repology=("project: ${gives}")
