# Benchprep Tagster

## This project is deprecated. The functionality has been ported to the [`bp`][1] utility CLI.

Benchprep Tagster is a small set of commands to identify, version,
created and push git tags for deployments.
It is easy to integrate into any of your deployment systems (vlad, cap etc)

## Usage (Tagging)

1. Include gem in your gemfile
2. Run `bundle exec tag` to create and push minor(default) tag
3. Profit!

### Options

If you want to deploy major you can use `bundle exec tag --major`.

You can append `--dry-run` to the end of your command to see what tag would have been created
without pushing it to the remote and creating it locally

## Usage (Creating deployment branches)

1.  Change directory (`cd`) to the root directory of the repository for which you'd like to create a deployment branch
2.  Execute `prepare` using Bundler
    - Example: `bundle exec prepare`
    - This will create and push a branch using the agreed upon branch naming convention (`deploy-YYYYDDMM`) where `YYYYDDMM` refers to the _deployment_ date, not the date on which the branch is created.
    - NOTE:  If no script parameters are specified, the script assumes the deployment date will be the one week from the day on which the branch is created.  For example, if the branch is created on Thursday, August 22, 2019, a branch named `deploy-20190829` will be created.

### Options

1.  You can optionally pass a date parameter.  This date value should represent the anticpated deployment date.  The date should be formatted as follows: `YYYYMMDD`.
2.  Example:  `bundle exec prepare 20180411`
    - The result of this example would be a new branch named `deploy-20180411`

[1]: https://github.com/watermelonexpress/bp
