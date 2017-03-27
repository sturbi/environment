#!/bin/bash

for D in *; do [ -d "${D}" ] && cd ${D} && git pull && cd .. ; done


