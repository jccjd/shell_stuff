#! /bin/bash
# https://tldp.org/LDP/abs/html/sha-bang.html code
echo "Hello World"
# system variables user space and system space 

echo $BASH
echo $BASH_VERSION

# No Programming language is perfect. There is not even a single best language
# there are only languages well suited or perhaps poorly suited for paricular purposes

# Cleanup
# Run as root, of course.
cd /var/log
cat /dev/null > message
cat /dev/null > wtmp
echo "Log files cleaned up"
