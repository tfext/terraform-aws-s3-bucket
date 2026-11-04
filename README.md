# terraform-aws-s3-bucket

Create a security-compliant S3 bucket

## Inputs

| Name | Type | Default | Description |
|---|---|---|---|
| `name` | `string` | required | Bucket name |
| `versioned` | `bool` | `false` | Enable versioning |
| `encrypt` | `bool` | `false` | Enable SSE-S3 (`AES256`) default encryption with a bucket key |
| `cors` | `object` | `{ enabled = false }` | CORS configuration: `enabled`, plus optional `methods` (`["GET"]`), `origins` (`["*"]`) and `headers` (`["Authorization"]`) |
| `restrict_public_buckets` | `bool` | `false` | Set `restrict_public_buckets` on the public access block, which always blocks public ACLs and policies and ignores public ACLs |

## Outputs

| Name | Description |
|---|---|
| `bucket` | Bucket name |
| `arn` | Bucket ARN |
| `bucket_domain_name` | Bucket domain name |
| `bucket_regional_domain_name` | Bucket regional domain name |
