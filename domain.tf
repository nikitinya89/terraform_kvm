resource "libvirt_domain" "domain" {
  name   = "${var.prefix}-${var.domain_name}"
  memory = var.vm.ram
  vcpu   = var.vm.cpu

  network_interface {
    bridge         = var.vm.bridge
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.root.id
  }
  depends_on = [libvirt_volume.root]
  cloudinit  = libvirt_cloudinit_disk.commoninit.id

  qemu_agent = true
  autostart  = true

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_port = "1"
    target_type = "virtio"
  }
}
