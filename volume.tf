resource "libvirt_volume" "root" {
  name   = "${var.prefix}-root"
  pool   = libvirt_pool.pool.name
  source = var.image.url
  format = "qcow2"
}
