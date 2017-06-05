**Inactive Project:** I ported this tool to Golang, in [akerl/speculate](https://github.com/akerl/speculate) due to the benefits of having a zero-dep binary to assume roles from.

speculate
=========

[![Gem Version](https://img.shields.io/gem/v/speculate.svg)](https://rubygems.org/gems/speculate)
[![Dependency Status](https://img.shields.io/gemnasium/akerl/ruby-speculate.svg)](https://gemnasium.com/akerl/ruby-speculate)
[![Build Status](https://img.shields.io/circleci/project/akerl/ruby-speculate.svg)](https://circleci.com/gh/akerl/ruby-speculate)
[![Coverage Status](https://img.shields.io/codecov/c/github/akerl/ruby-speculate.svg)](https://codecov.io/github/akerl/ruby-speculate)
[![Code Quality](https://img.shields.io/codacy/1a0888d1510f4e39b62db9c8699c4946.svg)](https://www.codacy.com/app/akerl/ruby-speculate)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Tool for assuming roles in AWS accounts

## Usage

```
❯ speculate --help
speculate 0.0.3 -- Tool for assuming roles in AWS accounts

Usage:

  speculate [options] role-name

Options:
-a ACCOUNT_ID, --accountid ACCOUNT_ID  Account ID to assume role on
        -b, --browser      Open console URL in browser
        -l, --logout       Log out of existing console browser session first
-m [TOKEN], --mfa [TOKEN]  Use MFA when assuming role
        -h, --help         Show this message
        -v, --version      Print the name and version
        -t, --trace        Show the full backtrace when an error occurs
```

This tool uses AWS's Ruby SDK, so it looks for your initial creds in the same places that library does, [which is described here](https://github.com/aws/aws-sdk-ruby#configuration).

To assume the `admin` role on the local account, use `speculate admin`. If you need MFA, you can call `speculate admin -m` or `speculate -m 123456 admin` (replacing 123456 with your valid MFA code).

To assume a role on another account, use `speculate -a TARGET_ACCOUNT_ID ROLE_NAME`.

To open a browser window automatically with the new role, add `-b`. Since AWS doesn't let you log into more than one account per browser session, you can use `-b -l` to first open the logout URL to log you out.

## Installation

    gem install speculate

## License

speculate is released under the MIT License. See the bundled LICENSE file for details.

