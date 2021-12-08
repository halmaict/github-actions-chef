# github-actions-chef

[![CI State](https://github.com/halmaict/github-actions-chef/workflows/release/badge.svg)](https://github.com/halmaict/github-actions-chef)

A Github Action to run Chef Cookstyle on a collection of cookbooks

## Usage

```yaml
name: cookstyle

on: [push, pull_request]

jobs:
  cookstyle:

    runs-on: ubuntu-latest

    steps:
    - name: Check out code
      uses: actions/checkout@v2
    - name: Run Chef Delivery
      uses: halmaict/github-actions-chef@master
      env:
        GITHUB_EVENT_BEFORE: ${{ github.event.before }}
        CHEF_LICENSE: accept-no-persist
```
