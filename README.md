# Benchprep Tagster

Benchprep Tagster is a small set of commands to identify, version,
created and push git tags for deployments.
It is easy to integrate into any of your deployment systems (vlad, cap etc)

## Usage

1. Include gem in your gemfile
2. Run `bundle exec tag` to create and push minor(default) tag
3. Profit!

## Options

If you want to deploy major you can use `bundle exec tag --major`.

You can append `--dry-run` to the end of your command to see what tag would have been created
without pushing it to the remote and creating it locally
