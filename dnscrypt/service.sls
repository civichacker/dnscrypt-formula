{% from "dnscrypt/map.jinja" import dnscrypt with context %}

default is in-place:
  file.managed:
    - name: /etc/default/dnscrypt-wrapper
    - source: salt://dnscrypt/files/default
    - template: jinja
  service.running:
    - name: dnscrypt-wrapper

ensure service is running:
  file.managed:
    - name: /etc/systemd/system/dnscrypt-wrapper.service
    - source: salt://dnscrypt/files/service.jinja
    - template: jinja
  service.running:
    - name: dnscrypt-wrapper
