# Префикс для создаваемых объектов
variable "prefix" {
  type = string
}



# Параметры облачного образа
variable "image" {
  type = object({
    name = string
    url  = string
  })
  default = {
    name = "ubuntu-focal"
    url  = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  }
}

# Параметры виртуальной машины
variable "vm" {
  type = object({
    cpu    = number
    ram    = number
    disk   = number
    bridge = string
  })
}

variable "domain_name" {
  type = string
}

variable "root_password" {
  type = string
  description = "root password for cloud-init"
  default = "Qwerty123"
}

# Путь, где будет хранится пул проекта
variable "pool_path" {
  type    = string
  default = "/var/lib/libvirt/"
}

#Тип пула
variable "pool_type" {
  type    = string
  default = "dir"
  validation {
    condition     = contains(["dir", "logical"], var.pool_type)
    error_message = "Значение переменной 'pool_type' должно быть 'dir' или 'logical'."
  }
}
