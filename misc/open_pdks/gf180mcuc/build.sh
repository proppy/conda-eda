#!/bin/bash

# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

curl -L -O https://github.com/proppy/volare-gf180mcu-wip/releases/download/gf180mcu-d7c3a52_465f1da_3d1aed6/default.tar.xz
mkdir -p $PREFIX/share/pdk/ 
tar -C $PREFIX/share/pdk -xvf default.tar.xz
find $PREFIX/