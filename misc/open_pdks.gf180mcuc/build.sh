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

PDK_VERSION='8f01d8f4d17110a53080cafc52c7762b94101f1d'

mkdir -p $PREFIX/share/pdk
curl --silent -L https://github.com/efabless/volare/releases/download/gf180mcu-$PDK_VERSION/default.tar.xz | tar -xvJf - -C $PREFIX/share/pdk gf180mcuC/
