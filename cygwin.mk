#<copyright notice="lm-source" pids="" years="2015,2017">
#***************************************************************************
# Copyright (c) 2015,2017 IBM Corp.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Contributors:
#    Jerry Stevens - Initial implementation
#    Various members of the WebSphere MQ Performance Team at IBM Hursley UK
#***************************************************************************
#*</copyright>
############################################################################
#                                                                          #
# Performance Harness for IBM MQ C-MQI interface                           #
#                                                                          #
############################################################################
#
# Settings for building on WindowsNT+ under CYGWIN...

ifeq ($(shell uname -o),Cygwin)
	OSTYPE = Cygwin
endif
INCLUDE += $(C_INCLUDE_PATH)

# Set addressing mode
BITNESS = $(shell getconf LONG_BIT)

# Get processor architecture
ARCH ?= $(shell uname -m)

# Share the same linux.mk file settings
include linux.mk

# Fixup the executable file extension
ifeq ($(BITNESS),64)
	EXE = 64.exe
else
	EXE = .exe
endif
