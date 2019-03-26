#!/bin/bash
echo n | ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N "" 2>&1 >/dev/null
echo  "{\"path\":\"~/.ssh/id_rsa\"}"
