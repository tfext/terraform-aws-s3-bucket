# terraform-aws-s3-bucket

Create a security-compliant S3 bucket

## Inputs

| Name | Type | Default | Description |
|---|---|---|---|
| `name` | `string` | required | Bucket name |
| `versioned` | `bool` | `false` | Enable versioning |
| `encrypt` | `bool` | `false` | Manage SSE-S3 (`AES256`) default encryption explicitly. AWS applies it to every bucket anyway |
| `cors` | `object` | `{ enabled = false }` | CORS configuration: `enabled`, plus optional `methods` (`["GET"]`), `origins` (`["*"]`) and `headers` (`["Authorization"]`) |
| `noncurrent_version_expiration_days` | `number` | `null` | For a versioned bucket, delete noncurrent object versions after this many days. `null` keeps them forever |
| `object_lock` | `object` | `null` | Default Object Lock retention for new objects: `days`, and `mode` (`GOVERNANCE` or `COMPLIANCE`, default `GOVERNANCE`). Needs `versioned = true`, and only takes effect when the bucket is created |
| `restrict_public_buckets` | `bool` | `true` | Set `restrict_public_buckets` on the public access block, which always blocks public ACLs and policies and ignores public ACLs |

## Outputs

| Name | Description |
|---|---|
| `bucket` | Bucket name |
| `arn` | Bucket ARN |
| `bucket_domain_name` | Bucket domain name |
| `bucket_regional_domain_name` | Bucket regional domain name |
