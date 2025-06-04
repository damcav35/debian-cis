#!/bin/bash

find bin/hardening -type f -exec basename {} \; | sort > /tmp/checks_file
> /tmp/checks_links ; find versions/ -type l ! -name default -exec readlink -f {} \; | sort -ud | while read i ; do basename "$i" >> /tmp/checks_links ; done

comm -32 /tmp/checks_file /tmp/checks_links
