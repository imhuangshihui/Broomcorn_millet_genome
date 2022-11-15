#!/bin/bash
source ~/.bashrc
/path/to/TransDecoder-v5.5.0/util/gtf_genome_to_cdna_fasta.pl assembly.gtf final_v2.fa > transcript.fasta

/path/to/TransDecoder-v5.5.0/util/gtf_to_alignment_gff3.pl assembly.gtf > transcript.gff3 

/path/to/software/TransDecoder-v5.5.0/TransDecoder.LongOrfs -t transcript.fasta 

/path/to/diamond makedb --in ./uniprot_sprot.fasta --db ./uniprot_sprot.fasta

/path/to/diamond blastp -d ./uniprot_sprot.fasta -q ./transcript.fasta.transdecoder_dir/longest_orfs.pep --evalue 1e-5 --max-target-seqs 1 > blastp.outfmt6

/path/to/TransDecoder-v5.5.0/TransDecoder.Predict -t transcript.fasta --retain_blastp_hits blastp.outfmt6

/path/to/TransDecoder-v5.5.0/util/cdna_alignment_orf_to_genome_orf.pl transcript.fasta.transdecoder.gff3 transcript.gff3 transcript.fasta > transcripts.fasta.transdecoder.genome.gff3 
