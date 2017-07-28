### BWA
bwa-compile:
  archive.extracted:
    - name: /home/vagrant/install/tmp
    - source: /home/vagrant/install/source/bwa-0.7.15.tar.bz2
    - user: vagrant
    - group: vagrant
  cmd.run:
    - name: cd /home/vagrant/install/tmp/bwa-0.7.15 && make
    - unless: ls /usr/local/bwa/bwa
bwa-copy:
  # BWA don't have make install;  Move entire directory
  file.copy:
    - source: /home/vagrant/install/tmp/bwa-0.7.15
    - name: /usr/local/bwa-0.7.15
bwa-cleanup:
   # Need to clean up tmp directory
  file.directory:
    - name: /home/vagrant/install/tmp/
    - clean: True
bwa-symlink:
   # Symlink always points to the latest version of the software
   # Users will always be using the latest as long as the symlink is
   # included in user $PATH
  file.symlink:
    - target: /usr/local/bwa-0.7.15
    - name: /usr/local/bwa
    - force: True

### CDHIT
cdhit-install:
  archive.extracted:
    - name: /home/vagrant/install/tmp
    - source: /home/vagrant/install/source/cdhit-4.6.8.tar.gz
    - user: vagrant
    - group: vagrant
  cmd.run:
    - name: cd /home/vagrant/install/tmp/cdhit-4.6.8 && make openmp=yes
    - unless: ls /usr/local/cdhit/cd-hit
cdhit-copy:
  # cdhit don't have make install; Copy entire directory to /usr/local
  file.copy:
    - source: /home/vagrant/install/tmp/cdhit-4.6.8
    - name: /usr/local/cdhit-4.6.8
cdhit-cleanup:
   # clean up tmp directory
  file.directory:
    - name: /home/vagrant/install/tmp/
    - clean: True
cdhit-symlink:
   # Symlink always points to the latest version of the software
   # Users will always be using the latest as long as the symlink is
   # included in user $PATH
  file.symlink:
    - target: /usr/local/cdhit-4.6.8
    - name: /usr/local/cdhit
    - force: True

### Exonerate
exonerate-compile:
  archive.extracted:
    - name: /home/vagrant/install/tmp
    - source: /home/vagrant/install/source/exonerate-2.4.0.tar.gz
    - user: vagrant
    - group: vagrant
  cmd.run:
    - name: cd /home/vagrant/install/tmp/exonerate-2.4.0 && ./configure --prefix=/usr/local/exonerate-2.4.0 && make && sudo make install
    - unless: ls /usr/local/exonerate/bin/
exonerate-cleanup:
  # Cleanup tmp directory
  file.directory:
    - name: /home/vagrant/install/tmp/
    - clean: True
exonerate-symlink:
  file.symlink:
    - target: /usr/local/exonerate-2.4.0
    - name: /usr/local/exonerate
    - force: True


### Samtools
samtools-compile:
  archive.extracted:
    - name: /home/vagrant/install/tmp
    - source: /home/vagrant/install/source/samtools-1.5.tar.bz2
    - user: vagrant
    - group: vagrant
  cmd.run:
    - name: cd /home/vagrant/install/tmp/samtools-1.5 && ./configure --prefix=/usr/local/samtools-1.5 && make && sudo make install
    - unless: ls /usr/local/samtools/samtools
samtools-cleanup:
  file.directory:
    - name: /home/vagrant/install/tmp/
    - clean: True
samtools-symlink:
  file.symlink:
    - target: /usr/local/samtools-1.5
    - name: /usr/local/samtools
    - force: True

### Trinity
trinity-compile:
  archive.extracted:
    - name: /home/vagrant/install/tmp
    - source: /home/vagrant/install/source/Trinity-v2.4.0.tar.gz
    - user: vagrant
    - group: vagrant
  cmd.run:
    - name: cd /home/vagrant/install/tmp/trinityrnaseq-Trinity-v2.4.0 && make
    - unless: ls /usr/local/Trinity/Trinity
trinity-copy:
  # trinity don't have make install;  Move entire directory to /usr/local
  file.copy:
    - source: /home/vagrant/install/tmp/trinityrnaseq-Trinity-v2.4.0
    - name: /usr/local/Trinity-v2.4.0
trinity-symlink:
  file.symlink:
    - target: /usr/local/Trinity-v2.4.0
    - name: /usr/local/Trinity
    - force: True


### TransDecoder
transdecoder-compile:
  archive.extracted:
    - name: /home/vagrant/install/tmp
    - source: /home/vagrant/install/source/v3.0.1.tar.gz
    - user: vagrant
    - group: vagrant
  cmd.run:
    - name: cd /home/vagrant/install/tmp/TransDecoder-3.0.1 && make
    - unless: ls /usr/local/TransDecoder/TransDecoder.LongOrfs
transdecoder-copy:
  # TransDecoder don't have make install; 
  # Move entire directory to /usr/local
  file.copy:
    - source: /home/vagrant/install/tmp/TransDecoder-3.0.1
    - name: /usr/local/TransDecoder-3.0.1
transdecoder-symlink:
  file.symlink:
    - target: /usr/local/TransDecoder-3.0.1
    - name: /usr/local/TransDecoder
    - force: True
