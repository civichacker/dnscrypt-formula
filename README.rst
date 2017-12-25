dnscrypt
========

Available states
================

.. contents::
    :local:

``dnscrypt``
-----------

Compile dnscrypt from source and start it up.

``dnscrypt.deps``
-----------------

Installs basic dependencies such as, `libsodium`, `libeven` and `git`


``dnscrypt.source``
-----------------

Downloads source and compiles, then installs it.


``dnscrypt.service``
-----------------

Setups SystemD service and starts it.


Formula Defaults:
=================

.. code-block:: yaml

  dnscrypt:
    user: dnscrypt
    group: dnscrypt
    install_prefix: /usr/local
    config_dir: /etc/dnscrypt
    build_dir: /tmp/dnscrypt-wrapper
    listen_address: 0.0.0.0:443
    provider_cert: 1.cert
    dnscrypt_key: 1.key
    cert_expiration: 365
    resolver: 8.8.8.8:53

Any of the above variables can overridden. Assuming one desires to use the defaults, `provider_name` is the only required and does not have a default.

Pillar customizations:
==========================

.. code-block:: yaml

  dnscrypt:
    provider_name: 2.dnscrypt.example.com
