#!/bin/bash

source ~/.bashrc

/home/wangzhiheng/huangshihui/software/TransDecoder-v5.5.0/util/gtf_genome_to_cdna_fasta.pl /data14/huangshihui/v2_annotation/hisat2_results_for_stringtie/stringtie_gtf/TACO_results/assembly.gtf ./longmi_v2.fa > transcript.fasta
/home/wangzhiheng/huangshihui/software/TransDecoder-v5.5.0/util/gtf_to_alignment_gff3.pl /data14/huangshihui/v2_annotation/hisat2_results_for_stringtie/stringtie_gtf/TACO_results/assembly.gtf > transcript.gff3

/home/wangzhiheng/huangshihui/software/TransDecoder-v5.5.0/TransDecoder.LongOrfs -t transcript.fasta

./diamond makedb --in ./uniprot_sprot.fasta --db ./uniprot_sprot.fasta ./diamond blastp -d ./uniprot_sprot.fasta -q ./transcript.fasta.transdecoder_dir/longest_orfs.pep --evalue 1e-5 --max-target-seqs 1 > blastp.outfmt6

/home/wangzhiheng/huangshihui/software/TransDecoder-v5.5.0/TransDecoder.Predict -t transcript.fasta --retain_blastp_hits blastp.outfmt6

/home/wangzhiheng/huangshihui/software/TransDecoder-v5.5.0/util/cdna_alignment_orf_to_genome_orf.pl transcript.fasta.transdecoder.gff3 transcript.gff3 transcript.fasta > transcripts.fasta.transdecoder.genome.gff3
