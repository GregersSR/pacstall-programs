name="onnxruntime-bin"
pkgname="onnxruntime"
repology=("project: onnxruntime")
replace=("${pkgname}" "${pkgname}-bin" "${pkgname}-1-7-0-bin" "${pkgname}-gpu" "${pkgname}-gpu-bin")
pkgver="1.16.3"
url="https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz"
pkgdesc="Cross-platform inference and training machine-learning accelerator"
hash="b072f989d6315ac0e22dcb4771b083c5156d974a3496ac3504c77f4062eb248e"
maintainer="Zahrun <Zahrun@github.com>"

package() {
  sudo install -Dm755 "lib/lib${pkgname}.so.${pkgver}" -t "${pkgdir}/usr/local/lib"
  sudo install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
  sudo mkdir -p "${pkgdir}/usr/local/lib"
  sudo ln -sf "/usr/local/lib/lib${pkgname}.so.${pkgver}" "${pkgdir}/usr/local/lib/lib${pkgname}.so"
}
