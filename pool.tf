resource "libvirt_pool" "pool" {
  name = "${var.prefix}pool"
  type = var.pool_type
  target {
    path = "${var.pool_path}${var.prefix}-pool"
    }
}