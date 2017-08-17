### BWA
bwa-compile:
  archive.extracted:
    - name: /srv/salt/install/tmp
    - source: salt://linux/sources/bwa-0.7.15.tar.bz2
    - source: /srv/salt/install/sources/bwa-0.7.15.tar.bz2
    - unless: ls /usr/local/bwa-0.7.15/bwa
    - user: root
    - group: root
  cmd.run:
    - name: cd /srv/salt/install/tmp/bwa-0.7.15 && make
    - unless: ls /usr/local/bwa-0.7.15/bwa
bwa-copy:
  # BWA don't have make install;  Move entire directory
  file.copy:
    - source: /srv/salt/install/tmp/bwa-0.7.15
    - name: /usr/local/bwa-0.7.15
    - onchanges:
      - bwa-compile
bwa-cleanup:
   # Need to clean up tmp directory
  file.directory:
    - name: /srv/salt/install/tmp/
    - clean: True
    - onchanges:
      - bwa-copy
bwa-symlink:
   # Symlink always points to the latest version of the software
   # Users will always be using the latest as long as the symlink is
   # included in user $PATH
  file.symlink:
    - target: /usr/local/bwa-0.7.15
    - name: /usr/local/bwa
    - force: True
    - onchanges:
      - bwa-cleanup


### CDHIT
cdhit-install:
  archive.extracted:
    - name: /srv/salt/install/tmp
    - source: salt://linux/sources/cdhit-4.6.8.tar.gz
    - source: /srv/salt/install/sources/cdhit-4.6.8.tar.gz
    - user: root
    - group: root
    - unless: ls /usr/local/cdhit-4.6.8/cd-hit
  cmd.run:
    - name: cd /srv/salt/install/tmp/cdhit-4.6.8 && make openmp=yes
    - unless: ls /usr/local/cdhit-4.6.8/cd-hit
cdhit-copy:
  # cdhit don't have make install; Copy entire directory to /usr/local
  file.copy:
    - source: /srv/salt/install/tmp/cdhit-4.6.8
    - name: /usr/local/cdhit-4.6.8
    - onchanges:
      - cdhit-install
cdhit-cleanup:
   # clean up tmp directory
  file.directory:
    - name: /srv/salt/install/tmp/
    - clean: True
    - onchanges:
      - cdhit-copy
cdhit-symlink:
   # Symlink always points to the latest version of the software
   # Users will always be using the latest as long as the symlink is
   # included in user $PATH
  file.symlink:
    - target: /usr/local/cdhit-4.6.8
    - name: /usr/local/cdhit
    - force: True
    - onchanges:
      - cdhit-copy


### Exonerate
exonerate-compile:
  archive.extracted:
    - name: /srv/salt/install/tmp
    - source: salt://linux/sources/exonerate-2.4.0.tar.gz
    - source: /srv/salt/install/sources/exonerate-2.4.0.tar.gz
    - user: root
    - group: root
    - unless: ls /usr/local/exonerate-2.4.0/bin/exonerate
  cmd.run:
    - name: cd /srv/salt/install/tmp/exonerate-2.4.0 && ./configure --prefix=/usr/local/exonerate-2.4.0 && make && sudo make install
    - unless: ls /usr/local/exonerate-2.4.0/bin/exonerate
exonerate-cleanup:
  # Cleanup tmp directory
  file.directory:
    - name: /srv/salt/install/tmp/
    - clean: True
    - onchanges:
      - exonerate-compile
exonerate-symlink:
  file.symlink:
    - target: /usr/local/exonerate-2.4.0
    - name: /usr/local/exonerate
    - force: True
    - onchanges:
      - exonerate-cleanup


### Samtools
samtools-compile:
  archive.extracted:
    - name: /srv/salt/install/tmp
    - source: salt://linux/sources/samtools-1.5.tar.bz2
    - source: /srv/salt/install/sources/samtools-1.5.tar.bz2
    - user: root
    - group: root
    - unless: ls /usr/local/samtools-1.5/bin/samtools
  cmd.run:
    - name: cd /srv/salt/install/tmp/samtools-1.5 && ./configure --prefix=/usr/local/samtools-1.5 && make && sudo make install
    - unless: ls /usr/local/samtools-1.5/bin/samtools
samtools-cleanup:
  file.directory:
    - name: /srv/salt/install/tmp/
    - clean: True
    - onchanges:
      - samtools-compile
samtools-symlink:
  file.symlink:
    - target: /usr/local/samtools-1.5
    - name: /usr/local/samtools
    - force: True
    - onchanges:
      - samtools-cleanup


### Trinity
trinity-compile:
  archive.extracted:
    - name: /srv/salt/install/tmp
    - source: salt://linux/sources/Trinity-v2.4.0.tar.gz
    - source: /srv/salt/install/sources/Trinity-v2.4.0.tar.gz
    - user: root
    - group: root
    - unless: /usr/local/Trinity-v2.4.0/Trinity
  cmd.run:
    - name: cd /srv/salt/install/tmp/trinityrnaseq-Trinity-v2.4.0 && make
    - unless: /usr/local/Trinity-v2.4.0/Trinity
trinity-copy:
  # trinity don't have make install;  Move entire directory to /usr/local
  file.copy:
    - source: /srv/salt/install/tmp/trinityrnaseq-Trinity-v2.4.0
    - name: /usr/local/Trinity-v2.4.0
    - onchanges:
      - trinity-compile
trinity-symlink:
  file.symlink:
    - target: /usr/local/Trinity-v2.4.0
    - name: /usr/local/Trinity
    - force: True
    - onchanges:
      - trinity-copy


### TransDecoder
transdecoder-compile:
  archive.extracted:
    - name: /srv/salt/install/tmp
    - source: salt://linux/sources/v3.0.1.tar.gz
    - source: /srv/salt/install/sources/v3.0.1.tar.gz
    - user: root
    - group: root
    - unless: ls /usr/local/TransDecoder-3.0.1/TransDecoder.LongOrfs
  cmd.run:
    - name: cd /srv/salt/install/tmp/TransDecoder-3.0.1 && make
    - unless: ls /usr/local/TransDecoder-3.0.1/TransDecoder.LongOrfs
transdecoder-copy:
  # TransDecoder don't have make install; 
  # Move entire directory to /usr/local
  file.copy:
    - source: /srv/salt/install/tmp/TransDecoder-3.0.1
    - name: /usr/local/TransDecoder-3.0.1
    - onchanges:
      - transdecoder-compile
transdecoder-symlink:
  file.symlink:
    - target: /usr/local/TransDecoder-3.0.1
    - name: /usr/local/TransDecoder
    - force: True
    - onchanges:
      - transdecoder-copy
