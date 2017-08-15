### General workflow for installing binaries.
# 1. Extract archive to /usr/local
# 2. (Optional) Rename directory to include version number
# 3. Add symlink to /usr/local/


### BBMap
BBMap-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/BBMap_37.36.tar.gz
    - unless: ls /usr/local/BBMap_37.36/bbmap.sh
    - user: root
    - group: root
BBMap-rename:
  file.rename:
    - source: /usr/local/bbmap
    - name: /usr/local/BBMap_37.36
    - onchanges:
      - BBMap-extract
BBMap-symlink:
  file.symlink:
    - target: /usr/local/BBMap_37.36
    - name: /usr/local/BBMap
    - onchanges: 
      - BBMap-rename
    - force: True

### BLAST
blast-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/ncbi-blast-2.6.0+-x64-linux.tar.gz
    - unless: ls /usr/local/ncbi-blast-2.6.0+/bin/blastn
    - user: root
    - group: root
blast-symlink:
  file.symlink:
    - target: /usr/local/ncbi-blast-2.6.0+
    - name: /usr/local/blast
    - onchanges:
      - blast-extract
    - force: True

### Bowtie
bowtie-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/bowtie-1.2.1.1-linux-x86_64.zip
    - unless: ls /usr/local/bowtie-1.2.1.1/bowtie
    - user: root
    - group: root
bowtie-symlink:
  file.symlink:
    - target: /usr/local/bowtie-1.2.1.1
    - name: /usr/local/bowtie
    - onchanges:
      - bowtie-extract
    - force: True

### Bowtie2
bowtie2-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/bowtie2-2.3.2-linux-x86_64.zip
    - unless: ls /usr/local/bowtie2-2.3.2/bowtie2
    - user: root
    - group: root
bowtie2-symlink:
  file.symlink:
    - target: /usr/local/bowtie2-2.3.2
    - name: /usr/local/bowtie2
    - onchanges:
      - bowtie2-extract
    - force: True

### FastQC
fastqc-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/fastqc_v0.11.5.zip
    - unless: ls /usr/local/FastQC-0.11.5/fastqc
    - user: root
    - group: root
fastqc-rename:
  file.rename:
    - source: /usr/local/FastQC
    - name: /usr/local/FastQC_0.11.5
    - onchanges:
      - fastqc-extract
fastqc-symlink:
  file.symlink:
    - target: /usr/local/FastQC_0.11.5
    - name: /usr/local/FastQC
    - force: True
    - onchanges:
      - fastqc-rename
# fastqc is not executable by default, change to mode 755
/usr/local/FastQC_0.11.5/fastqc:
    file.managed:
      - mode: 755
      - onchanges:
        - fastqc-extract


### Sailfish
sailfish-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/SailfishBeta-0.10.0_CentOS5.tar.gz
    - unless: ls /usr/local/SailfishBeta-0.10.0/bin/sailfish
    - user: root
    - group: root
sailfish-rename:
  file.rename:
    - source: /usr/local/SailfishBeta-0.10.0_CentOS5
    - name: /usr/local/SailfishBeta-0.10.0
    - onchanges:
      - sailfish-extract
sailfish-symlink:
  file.symlink:
    - target: /usr/local/SailfishBeta-0.10.0
    - name: /usr/local/Sailfish
    - force: True
    - onchanges:
      - sailfish-rename


### Salmon
salmon-extract:
  archive.extracted:
    - name: /usr/local/
    - source: /srv/salt/install/binaries/Salmon-0.8.2_linux_x86_64.tar.gz
    - unless: /usr/local/Salmon-0.8.2/bin/salmon
    - user: root
    - group: root
salmon-rename:
  file.rename:
    - source: /usr/local/Salmon-0.8.2_linux_x86_64
    - name: /usr/local/Salmon-0.8.2
    - onchanges:
      - salmon-extract
salmon-symlink:
  file.symlink:
    - target: /usr/local/Salmon-0.8.2
    - name: /usr/local/Salmon
    - force: True
    - onchanges:
      - salmon-rename


### Scripts
# bioinfo scripts:
#   file.directory:
#     - name: /usr/local/scripts
#     - user: root
#     - group: root
#     - mode: 755
#   git.latest:
#     - name: git@github.com:myuen/scripts.git
#     - user: root
#     - https_user
#     - identity: /home/myuen/.ssh/id_ed25519.pub
#     - target: /usr/local/scripts
