variable "name" {
  type = string
}

variable "versioned" {
  type    = bool
  default = false
}

variable "encrypt" {
  type    = bool
  default = false
}

variable "cors" {
  type = object({
    enabled = bool
    methods = optional(list(string))
    origins = optional(list(string))
    headers = optional(list(string))
  })
  nullable    = false
  default     = { enabled = false }
  description = "Set to enable CORS configuration"
}

variable "restrict_public_buckets" {
  type        = bool
  default     = false
  nullable    = false
  description = "Set restrict_public_buckets on the bucket's public access block"
}
