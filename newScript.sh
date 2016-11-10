#! /bin/bash
# Author: leo
# Date & Time: 2016-11-10 11:30:04
# Description: Auto create script comment

if ! grep "^#!" $1 &> /dev/null ; then
cat >> $1 << EOF
#! /bin/bash
# Author: leo
# Date & Time: `date +"%F %T"`
# Description:

EOF
fi
vim +5 $1
