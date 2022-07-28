#!/bin/bash

source ~/.bashrc

nucmer -maxmatch -l 100 -c 500 longmi_v2_subA.fa longmi_v2_subB.fa -prefix longmi_A_ref_B_assemblytics
dnadiff -d longmi_A_ref_B_assemblytics.delta -p longmi_A_ref_B_assemblytics_dnadiff
