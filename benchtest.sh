#!/bin/sh
sysbench cpu run
sysbench memory run
sysbench fileio --file-test-mode=seqwr run
