#!/bin/bash

source ~/.bashrc

nucmer -c 200 -g 200 longmi_v2.fa zou.fa -prefix longmi_ref_zou
dnadiff -d longmi_ref_zou.delta -p longmi_ref_zou_dnadiff

