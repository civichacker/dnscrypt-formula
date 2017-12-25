dnscrypt-deps:
  pkg.installed:
    - refresh: True
    - fromrepo: testing
    - pkgs:
      - libsodium-dev
      - libevent-dev
    - require:
      - sls: dnscrypt.repo

dnscrypt build:
  pkg.installed:
    - refresh: True
    - fromrepo: stable
    - pkgs:
      - build-essential
      - autoconf
