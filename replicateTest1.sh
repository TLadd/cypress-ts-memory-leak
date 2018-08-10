#! /bin/sh

for FILE in `seq 2 50`; do cp cypress/integration/test1.ts cypress/integration/test$FILE.ts; done