### General workflow for installing binaries.
# 1. Extract archive to /usr/local
# 2. (Optional) Rename directory to include version number
# 3. Add symlink to /usr/local/


### BBMap
BBMap-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/BBMap_37.36.tar.gz
    - user: vagrant
    - group: vagrant
BBMap-rename:
  file.rename:
    - source: /usr/local/bbmap
    - name: /usr/local/BBMap_37.36
BBMap-symlink:
  file.symlink:
    - target: /usr/local/BBMap_37.36
    - name: /usr/local/BBMap
    - force: True

### BLAST
blast-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/ncbi-blast-2.6.0+-x64-linux.tar.gz
    - user: vagrant
    - group: vagrant
blast-symlink:
  file.symlink:
    - target: /usr/local/ncbi-blast-2.6.0+
    - name: /usr/local/blast
    - force: True

### Bowtie
bowtie-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/bowtie-1.2.1.1-linux-x86_64.zip
    - user: vagrant
    - group: vagrant
bowtie-symlink:
  file.symlink:
    - target: /usr/local/bowtie-1.2.1.1
    - name: /usr/local/bowtie
    - force: True

### Bowtie2
bowtie2-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/bowtie2-2.3.2-linux-x86_64.zip
    - user: vagrant
    - group: vagrant
bowtie2-symlink:
  file.symlink:
    - target: /usr/local/bowtie2-2.3.2
    - name: /usr/local/bowtie2
    - force: True

### FastQC
fastqc-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/fastqc_v0.11.5.zip
    - user: vagrant
    - group: vagrant
fastqc-rename:
  file.rename:
    - source: /usr/local/FastQC
    - name: /usr/local/FastQC_0.11.5
fastqc-symlink:
  file.symlink:
    - target: /usr/local/FastQC_0.11.5
    - name: /usr/local/FastQC
    - force: True
# fastqc is not executable by default, change to mode 755
/usr/local/FastQC_0.11.5/fastqc:
    file.managed:
      - mode: 755


### Sailfish
sailfish-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/SailfishBeta-0.10.0_CentOS5.tar.gz
    - user: vagrant
    - group: vagrant
sailfish-rename:
  file.rename:
    - source: /usr/local/SailfishBeta-0.10.0_CentOS5
    - name: /usr/local/SailfishBeta-0.10.0
sailfish-symlink:
  file.symlink:
    - target: /usr/local/SailfishBeta-0.10.0
    - name: /usr/local/Sailfish
    - force: True


### Salmon
salmon-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/Salmon-0.8.2_linux_x86_64.tar.gz
    - user: vagrant
    - group: vagrant
salmon-rename:
  file.rename:
    - source: /usr/local/Salmon-0.8.2_linux_x86_64
    - name: /usr/local/Salmon-0.8.2
salmon-symlink:
  file.symlink:
    - target: /usr/local/Salmon-0.8.2
    - name: /usr/local/Salmon
    - force: True


### Scripts
bioinfo scripts:
  file.directory:
    - name: /usr/local/scripts
    - user: vagrant
    - group: vagrant
    - mode: 755
  git.latest:
    - name: git@github.com:myuen/scripts.git
    - user: vagrant
    - target: /usr/local/scripts
