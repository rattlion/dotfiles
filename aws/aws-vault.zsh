export AWS_VAULT_FILE_PASSPHRASE="3mN6+PuB7htXIWLMfzvX0kMcsK4bdfTjtrS+pEVZpjk=" # Avoid entering a passphrase when using aws-vault
export AWS_VAULT_BACKEND="file" # Use the file backend of aws-vault
export AWS_SESSION_TTL="12h" # Set the session ttl to 12 hours to avoid reentering MFA multiple times a day
export AWS_ASSUME_ROLE_TTL="12h"

alias sg_mfa='op get totp "SG AWS"'

aws-sg-root () {
  aws-vault exec --mfa-token $(sg_mfa) default $@
}

aws-sg-order () {
  aws-vault exec --mfa-token $(sg_mfa) sweetgreen-order $@
}
