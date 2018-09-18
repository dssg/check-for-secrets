# check-for-secrets

Sometimes we check secrets into Github, which we should never do. `check-for-secrets` will look for the following things in Git history:

- API tokens
- Passwords in URLs (e.g. database URLS)
- IP addresses
- AWS addresses
- Non-empty jupyter notebook output
- Files with data (csv extensions?) [TODO]
- graphs (for now any images?) [TODO]


Call `run-check.sh <directory_name>` on a valid git directory. This can also be a github url. The script will try to install the Python package ['trufflehog'](https://github.com/dxa4481/truffleHog) locally if you don't have it, and then check the given directory for commits containing secrets.

## Advanced Use

`check-for-secrets` simply passes on all arguments sent to `trufflehog`, so you can override the defaults chosen by adding them in as arguments.

For instance, the high-entropy check is disabled by default because it is very time-intensive. To add it back in, pass ``--entropy 1``, for instance:

`run-check.sh --entropy 1 ../dirty-duck`

## Trufflehog notes

It will install trufflehog using `pip install trufflehog --user`. If you would like to install it in a different way, such as globally or in a virtualenv, you can install it beforehand. The script simply checks if the trufflehog command exists, and will not try to install anything if so.

## Improving check-for-secrets

`check-for-secrets` works using regular expressions. The database of known regular expressions can be found in [trufflehog_regexes.json](trufflehog_regexes.json). Feel free to add new regular expressions!
