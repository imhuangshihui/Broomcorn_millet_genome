#!/bin/bash

/path/to/pasa/opt/pasa-2.4.1/bin/seqclean transcript.fasta

/path/to/pasa/opt/pasa-2.4.1/Launch_PASA_pipeline.pl -c alignAssembly.config -C -r -R -g final_v2.fa -t transcript.fasta.clean -T -u transcript.fasta --ALIGNERS blat --CPU 40
