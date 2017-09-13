### General workflow for installing binaries.
# 1. Extract archive to /usr/local
# 2. (Optional) Rename directory to include version number
# 3. Add symlink to /usr/local/


### BBMap
BBMap-extract:
  archive.extracted:
    - name: /usr/local/
    - source: salt://software/linux/binaries/BBMap_37.36.tar.gz
    - source: /srv/salt/install/binaries/BBMap_37.36.tar.gz
    - unless: ls /usr/local/BBMap_37.36/bbmap.sh
    - user: root
    - group: root
BBMap-rename:
  file.rename:
    - source: /usr/local/bbmap
    - name: /usr/local/BBMap_37.36
    - watch:
      - archive: BBMap-extract
BBMap-symlink:
  file.symlink:
    - target: /usr/local/BBMap_37.36
    - name: /usr/local/BBMap
    - watch: 
      - archive: BBMap-extract
    - force: True

### BLAST
blast-extract:
  archive.extracted:
    - name: /usr/local/
    - source: salt://software/linux/binaries/ncbi-blast-2.6.0+-x64-linux.tar.gz
    - source: /srv/salt/install/binaries/ncbi-blast-2.6.0+-x64-linux.tar.gz
    - unless: ls /usr/local/ncbi-blast-2.6.0+/bin/blastn
    - user: root
    - group: root
blast-symlink:
  file.symlink:
    - target: /usr/local/ncbi-blast-2.6.0+
    - name: /usr/local/blast
    - watch:
      - archive: blast-extract
    - force: True

### Bowtie
bowtie-extract:
  archive.extracted:
    - name: /usr/local/
    - source: salt://software/linux//binaries/bowtie-1.2.1.1-linux-x86_64.zip
    - source: /srv/salt/install/binaries/bowtie-1.2.1.1-linux-x86_64.zip
    - unless: ls /usr/local/bowtie-1.2.1.1/bowtie
    - user: root
    - group: root
bowtie-symlink:
  file.symlink:
    - target: /usr/local/bowtie-1.2.1.1
    - name: /usr/local/bowtie
    - watch:
      - archive: bowtie-extract
    - force: True

### Bowtie2
bowtie2-extract:
  require:
    - pkg: tbb
  archive.extracted:
    - name: /usr/local/
    - source: salt://software/linux/binaries/bowtie2-2.3.2-linux-x86_64.zip
    - source: /srv/salt/install/binaries/bowtie2-2.3.2-linux-x86_64.zip
    - unless: ls /usr/local/bowtie2-2.3.2/bowtie2
    - user: root
    - group: root
bowtie2-symlink:
  file.symlink:
    - target: /usr/local/bowtie2-2.3.2
    - name: /usr/local/bowtie2
    - watch:
      - archive: bowtie2-extract
    - force: True

### FastQC
fastqc-extract:
  require:
    - pkg: java
  archive.extracted:
    - name: /usr/local/
    - source: salt://software/linux/binaries/fastqc_v0.11.5.zip 
    - source: /srv/salt/install/binaries/fastqc_v0.11.5.zip
    - unless: ls /usr/local/FastQC_0.11.5/fastqc
    - user: root
    - group: root
fastqc-rename:
  file.rename:
    - source: /usr/local/FastQC
    - name: /usr/local/FastQC_0.11.5
    - watch:
      - archive: fastqc-extract
fastqc-symlink:
  file.symlink:
    - target: /usr/local/FastQC_0.11.5
    - name: /usr/local/FastQC
    - force: True
    - watch:
      - archive: fastqc-extract
# fastqc is not executable by default, change to mode 755
/usr/local/FastQC_0.11.5/fastqc:
    file.managed:
      - mode: 755
      - watch:
        - archive: fastqc-extract


### Minimap2
minimap2-extract:
  archive.extracted:
    - name: /usr/local/
    - source: salt://software/linux/binaries/minimap2-2.1.1_x64-linux.tar.bz2
    - source: /srv/salt/install/binaries/minimap2-2.1.1_x64-linux.tar.bz2
    - unless: ls /usr/local/minimap2-2.1.1_x64-linux/minimap2
    - user: root
    - group: root
minimap2-symlink:
  file.symlink:
    - target: /usr/local/minimap2-2.1.1_x64-linux
    - name: /usr/local/minimap2
    - force: True
    - watch:
      - archive: minimap2-extract


### Sailfish
sailfish-extract:
  archive.extracted:
    - name: /usr/local/
    - source: salt://software/linux/binaries/SailfishBeta-0.10.0_CentOS5.tar.gz
    - source: /srv/salt/install/binaries/SailfishBeta-0.10.0_CentOS5.tar.gz
    - unless: ls /usr/local/SailfishBeta-0.10.0/bin/sailfish
    - user: root
    - group: root
sailfish-rename:
  file.rename:
    - source: /usr/local/SailfishBeta-0.10.0_CentOS5
    - name: /usr/local/SailfishBeta-0.10.0
    - watch:
      - archive: sailfish-extract
sailfish-symlink:
  file.symlink:
    - target: /usr/local/SailfishBeta-0.10.0
    - name: /usr/local/Sailfish
    - force: True
    - watch:
      - archive: sailfish-extract


### Salmon
salmon-extract:
  archive.extracted:
    - name: /usr/local/
    - source: salt://software/linux/binaries/Salmon-0.8.2_linux_x86_64.tar.gz
    - source: /srv/salt/install/binaries/Salmon-0.8.2_linux_x86_64.tar.gz
    - unless: ls /usr/local/Salmon-0.8.2/bin/salmon
    - user: root
    - group: root
salmon-rename:
  file.rename:
    - source: /usr/local/Salmon-0.8.2_linux_x86_64
    - name: /usr/local/Salmon-0.8.2
    - watch:
      - archive: salmon-extract
salmon-symlink:
  file.symlink:
    - target: /usr/local/Salmon-0.8.2
    - name: /usr/local/Salmon
    - force: True
    - watch:
      - archive: salmon-extract


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
