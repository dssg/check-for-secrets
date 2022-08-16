# check-for-secrets

Sometimes we check secrets into Github, which we should never do. `check-for-secrets` will look for the following things in Git history:

- API tokens
- Passwords in URLs (e.g. database URLS)
- IP addresses
- AWS addresses
- Non-empty jupyter notebook output
- non-empty files with data (csv, zip, tar.gz)
- graphs (for now any images?)


Call `audit-repo -r <git_repository_name>, ...` . or check all the available options with `audit-repo --help`
