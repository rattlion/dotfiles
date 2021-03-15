# export AWS_VAULT_FILE_PASSPHRASE="" # Avoid entering a passphrase when using aws-vault, put this in secrets
export AWS_VAULT_BACKEND="file" # Use the file backend of aws-vault
export AWS_SESSION_TTL="12h" # Set the session ttl to 12 hours to avoid reentering MFA multiple times a day
export AWS_ASSUME_ROLE_TTL="12h"

alias av='aws-vault'
