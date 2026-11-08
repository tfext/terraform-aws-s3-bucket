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
  default     = true
  nullable    = false
  description = "Set restrict_public_buckets on the bucket's public access block"
}

variable "noncurrent_version_expiration_days" {
  type        = number
  default     = null
  description = "Days after which noncurrent object versions are deleted, for a versioned bucket. Null keeps them forever"
}

variable "object_lock" {
  type = object({
    mode = optional(string, "GOVERNANCE")
    days = number
  })
  default     = null
  description = "Default S3 Object Lock retention for new objects. Needs versioned = true, and can only be set when the bucket is created"
}
