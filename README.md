# Build and Publish your Hugo Site to Github Pages

- [gohugoio/hugo: The world’s fastest framework for building websites.](https://github.com/gohugoio/hugo)

This Action builds your Hugo Site (using the latest Hugo Extended) and pushes it to Github Pages.

This action also contains support for sites that use Pygments for code highlighting, or use reStructuredText or asciidoc as the document format.
If your site requires the use of another externel helper, submit an issue and I'll try to add it (it needs to be supported by Alpine Linux).

## Getting started

This is a basic `Yaml` workflow to get you started:

```yaml
name: Publish Site

on:
  push:
    branches:
    - master

jobs:
  build-deploy:
    runs-on: ubuntu-18.04

    steps:
    - name: Checkout Repo
      uses: actions/checkout@master
      with:
        submodules: true

    - name: Publish Site
      uses: chabad360/hugo-gh-pages@master
      with:
        args: --gc --minify --cleanDestinationDir
      env:
        # CNAME: mysite.com # Use if you have a custom domain for your site
        # BRANCH: master # Use if your site is not hosted on the gh-pages branch
        GITHUB_TOKEN: ${{ secrets.PERSONAL_TOKEN }} # Requires a Github Personal Access Token (yes, you read correctly) with repo permissions.
```

To add to an already exsiting workflow, this is the section that matters:

```yaml
- name: Publish Site
      uses: chabad360/hugo-gh-pages@master
      with:
        args: --gc --minify --cleanDestinationDir
      env:
        # CNAME: mysite.com # Use if you have a custom domain for your site
        # BRANCH: master # Use if your site is not hosted on the gh-pages branch
        GITHUB_TOKEN: ${{ secrets.PERSONAL_TOKEN }} # Requires a Github Personal Access Token (yes, you read correctly) with repo permissions.
```

## Credit

This project is forked from [mattbailey/actions-hugo](github.com/mattbailey/actions-hugo)
