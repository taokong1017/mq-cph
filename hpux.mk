#<copyright notice="lm-source" pids="" years="2014,2017">
#***************************************************************************
# Copyright (c) 2014,2017 IBM Corp.
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
#    Various members of the WebSphere MQ Performance Team at IBM Hursley UK
#***************************************************************************
#*</copyright>
############################################################################
#                                                                          #
# Performance Harness for IBM MQ C-MQI interface                           #
#                                                                          #
############################################################################

# Get processor architecture
ARCH = $(shell uname -m)

# Include unix definitions
include unix.mk

CPPDEFS += CPH_HPUX

# Set library directory
MQLIB = $(MQ_INSTALLATION_PATH)/lib

# C compiler command
cc = /usr/local/bin/gcc -c

# C++ compiler command
CC = /usr/local/bin/g++ -c

# Linker command
LD = /usr/local/bin/g++

# Add flags to write dependency files
DEP = .d
CCFLAGS += -MMD -MP

# Add debug flags for debug build
Debug_CCFLAGS += -O0 -g3
Debug_CFLAGS += $(SYM)_GLIBC_DEBUG
Debug_CXXFLAGS += $(SYM)_GLIBCXX_DEBUG

#Add optimization for release build
Release_CCFLAGS = -O3

# Set the rpath on the linked executable
LDFLAGS += $(LP)$(MQLIB)

# Add stdc++ libs
LIBS += stdc++