variable "name" {
  type = string
}

variable "tags" {
  type    = any
  default = ""
}

variable "fifo_queue" {
  type    = bool
  default = false
}

variable "content_based_deduplication" {
  type    = bool
  default = false
}