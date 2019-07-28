#!/bin/bash
# 	template/TEST/template.sh/FVT-setup.sh  3.221.281  2019-07-28T12:22:51.500414-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  six-rpi3b.cptx86.com 3.220-1-g337137a  
# 	   add FVT.setup.sh for symbolic link creation for test case expended output 
#### production standard 3.0 shellcheck
#### production standard 5.1.160 Copyright
##       Copyright (c) 2019 Bradley Allen
##       MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.

rm -f FVT-options*.out
#
ln -fs FVT-option-help-001.expected FVT-option-help-002.expected
ln -fs FVT-option-help-001.expected FVT-option-help-003.expected
ln -fs FVT-option-help-001.expected FVT-option-help-004.expected
ln -fs FVT-option-help-001.expected FVT-option-help-005.expected
ln -fs FVT-option-help-001.expected FVT-option-help-006.expected
#		
ln -fs FVT-option-usage-001.expected FVT-option-usage-002.expected
ln -fs FVT-option-usage-001.expected FVT-option-usage-003.expected 
#
ln -fs FVT-option-version-001.expected FVT-option-version-002.expected
ln -fs FVT-option-version-001.expected FVT-option-version-003.expected
###		
