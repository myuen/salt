coreUtils:
  pkg.installed:
    - pkgs:
      - bzip2-devel.x86_64
      - emacs
      - gcc-c++.x86_64
      - git.x86_64
      - unzip.x86_64
curl:
  pkg.installed:
    - pkgs:
      - libcurl.x86_64
      - libcurl-devel.x86_64
glib2:
  pkg.installed:
    - name: glib2-devel.x86_64
java:
  pkg.installed:
    - name: java-1.8.0-openjdk.x86_64
ncurses-devel:
  pkg.installed:
    - name: ncurses-devel.x86_64
perl-trinity:
  pkg.installed:
    - pkgs:
      - perl-Data-Dumper.x86_64
      - perl-URI.noarch
ssl:
  pkg.installed:
    - pkgs:
      - openssl.x86_64
      - openssl-devel.x86_64
tbb:
  pkg.installed:
    - name: tbb.x86_64
xz:
  pkg.installed:
    - name: xz-devel.x86_64
zlib:
  pkg.installed:
    - name: zlib-devel.x86_64



