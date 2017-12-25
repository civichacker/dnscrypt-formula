{% from "dnscrypt/map.jinja" import dnscrypt with context %}

dnscrypt_source:
  git.latest:
    - name: https://github.com/cofyc/dnscrypt-wrapper.git
    - target: {{ dnscrypt.build_dir}}
    - rev: v0.3
    - require:
      - sls: dnscrypt.deps
  cmd.run:
    - cwd: {{ dnscrypt.build_dir}}
    - name: make configure


configure dnscrypt build:
  cmd.run:
    - cwd: {{ dnscrypt.build_dir}}
    - name: ./configure --prefix={{ dnscrypt.install_prefix }}

install dnscrypt:
  cmd.run:
    - cwd: {{ dnscrypt.build_dir}}
    - name: make install
