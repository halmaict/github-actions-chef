# github-actions-chef

[![CI State](https://github.com/halmaict/github-actions-chef/workflows/release/badge.svg)](https://github.com/halmaict/github-actions-chef)

A Github Action to run Chef Delivery on a cookbook

## Usage

```yaml
name: delivery

on: [push, pull_request]

jobs:
  delivery:

    runs-on: ubuntu-latest

    steps:
    - name: Check out code
      uses: actions/checkout@v2
    - name: Run Chef Delivery
      uses: halmaict/github-actions-chef@master
```
