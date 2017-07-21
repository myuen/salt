BBMap:
  archive.extracted:
    - name: /usr/local/
    - source: /home/vagrant/install/binaries/BBMap_37.36.tar.gz
    - user: vagrant
    - group: vagrant
  file.rename:
      - source: /usr/local/bbmap
      - name: /usr/local/BBMap_37.36
/usr/local/BBMap_37.36:
  file.symlink:
    - target: /usr/local/BBMap_37.36
    - name: /usr/local/BBMap
    - force: True
blast:
  archive.extracted:
    - name: /usr/local/
    - source: /home/vagrant/install/binaries/ncbi-blast-2.6.0+-x64-linux.tar.gz
    - user: vagrant
    - group: vagrant
  file.symlink:
    - target: /usr/local/ncbi-blast-2.6.0+
    - name: /usr/local/blast
    - force: True

bowtie:
  archive.extracted:
    - name: /usr/local/
    - source: /home/vagrant/install/binaries/bowtie-1.2.1.1-linux-x86_64.zip
    - user: vagrant
    - group: vagrant
  file.symlink:
    - target: /usr/local/bowtie-1.2.1.1
    - name: /usr/local/bowtie
    - force: True

bowtie2:
  archive.extracted:
    - name: /usr/local/
    - source: /home/vagrant/install/binaries/bowtie2-2.3.2-linux-x86_64.zip
    - user: vagrant
    - group: vagrant
  file.symlink:
    - target: /usr/local/bowtie2-2.3.2
    - name: /usr/local/bowtie2
    - force: True

#cd-hit:

#exonerate:

#FastQC:

#IGV:

#oases:

#R:

#sailfish:

#salmon:

#samtools:

#trinity:

#transdecoder:

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
