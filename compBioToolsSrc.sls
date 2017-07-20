#bowtie:

#bowtie2:

bwa:
  archive.extracted:
    - name: /home/vagrant/install/tmp
    - source: /home/vagrant/install/source/bwa-0.7.15.tar.bz2
    - user: vagrant
    - group: vagrant
  cmd.run:
    - name: cd /home/vagrant/install/tmp/bwa-0.7.15 && make
  # BWA don't have make install;  Move entire direcotyr
  file.copy:
    - source: /home/vagrant/install/tmp/bwa-0.7.15
    - name: /usr/local/bwa-0.7.15
   # Need to clean up tmp directory
#  file.direcotry:
#    - name: /home/vagrant/install/tmp/bwa-0.7.15
#    - clean: True

   # Symlink always points to the latest version of the software
   # Users will always be using the latest as long as the symlink is
     included in user $PATH
#  file.symlink:
#    - target: /usr/local/bwa-0.7.15
#    - name: /usr/local/bwa
#    - force: True

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
  # need to clean up tmp directory

#trinity:

#transdecoder:
