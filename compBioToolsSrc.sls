#bowtie:

#bowtie2:

#bwa:

#cd-hit:

#exonerate:

#FastQC:

#IGV:

#oases:

#sailfish:

#salmon:

samtools:
  archive.extracted:
    - name: /home/vagrant/install/tmp
    - source: /home/vagrant/install/source/samtools-1.5.tar.bz2
    - user: vagrant
    - group: vagrant
  cmd.run:
    - name: cd /home/vagrant/install/tmp/samtools-1.5 && ./configure --prefix=/usr/local/samtools-1.5 &&  make && sudo make install
  file.symlink:
    - target: /usr/local/samtools-1.5
    - name: /usr/local/samtools
    - force: True
#trinity:

#transdecoder:
