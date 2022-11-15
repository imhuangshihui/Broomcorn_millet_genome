#!/bin/bash
/path/to/evidencemodeler-1.1.1/EvmUtils/partition_EVM_inputs.pl --genome final_v2.fa --gene_predictions augustus_evm.gff3 --protein_alignments gemoma_evm.gff3 --transcript_alignments final_v2_RNA.gff3 --segmentSize 1000000 --overlapSize 10000 --partition_listing partitions_list.out

/path/to/evidencemodeler-1.1.1/EvmUtils/write_EVM_commands.pl --genome final_v2.fa --weights weight.txt --gene_predictions augustus_evm.gff3 --protein_alignments gemoma_evm.gff3 --transcript_alignments final_v2_RNA.gff3 --partitions partitions_list.out --output_file_name evm.out > commands.list

/path/to/evidencemodeler-1.1.1/EvmUtils/execute_EVM_commands.pl commands.list

/path/to/evidencemodeler-1.1.1/EvmUtils/recombine_EVM_partial_outputs.pl --partitions partitions_list.out --output_file_name evm.out

/path/to/evidencemodeler-1.1.1/EvmUtils/convert_EVM_outputs_to_GFF3.pl --partitions partitions_list.out --output_file_name evm.out --genome final_v2.fa
