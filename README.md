[![Build Status](https://github.com/pre-commit-ci/runner-image/actions/workflows/main.yml/badge.svg)](https://github.com/pre-commit-ci/runner-image/actions)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/pre-commit-ci/runner-image/main.svg)](https://results.pre-commit.ci/latest/github/pre-commit-ci/runner-image/main)

runner-image
============

This is the image that is used to build and run in pre-commit.ci.

### contributing new languages

additional languages used to impact the scaling time of pre-commit.ci but
are now factored in a way that they can be lazily loaded.  this requires
special care in the Dockerfile to make sure those languages function correctly.

a language consists of a few things after the `echo: 'end minimal'` marker:

- a single `ENV` instruction which sets up the environment variables for
  running that language
- a single `RUN` instruction which installs the language into `/opt/${lang}`
- the `RUN` instruction must also contain `echo 'lang: ${lang}'` such that
  the lazy loading machinery can identify where the language is.
- the value of `${lang}` must match the `language` field for pre-commit.

`swift` is one example language that is set up in this way.
