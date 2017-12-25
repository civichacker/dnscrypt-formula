debian-testing:
  pkgrepo.managed:
    - humanname: Debian Testing
    - name: deb http://http.us.debian.org/debian testing main non-free contrib
    - file: /etc/apt/sources.list.d/debian-testing.list
