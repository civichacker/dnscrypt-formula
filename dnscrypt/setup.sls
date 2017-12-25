{% from "dnscrypt/map.jinja" import dnscrypt with context %}

create dnscrypt user:
  group.present:
    - name: {{ dnscrypt.group }}
  user.present:
    - name: {{ dnscrypt.user }}
    - groups:
      - {{ dnscrypt.group }}
    - createhome: False
    - system: True
    - home: {{ dnscrypt.config_dir }}

generate provider keys:
  file.directory:
    - name: {{ dnscrypt.config_dir }}
    - user: {{ dnscrypt.user }}
    - group: {{ dnscrypt.group }}
    - mode: 0750
  cmd.run:
    - cwd: {{ dnscrypt.config_dir }}
    - name: dnscrypt-wrapper --gen-provider-keypair

generate short-term secret:
  cmd.run:
    - cwd: {{ dnscrypt.config_dir }}
    - name: dnscrypt-wrapper --gen-crypt-keypair --crypt-secretkey-file={{ dnscrypt.dnscrypt_key }}

generate short-term certificate:
  cmd.run:
    - cwd: {{ dnscrypt.config_dir }}
    - name: dnscrypt-wrapper --gen-cert-file --crypt-secretkey-file={{ dnscrypt.dnscrypt_key }} --provider-cert-file={{ dnscrypt.provider_cert }} --provider-publickey-file=public.key --provider-secretkey-file=secret.key --cert-file-expire-days={{ dnscrypt.cert_expiration }}
