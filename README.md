TWRP device tree for Motorola g7 (river)
==================================
## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core 1.8 GHz Cortex-A53
CHIPSET | Qualcomm SDM632 Snapdragon 632
GPU     | Adreno 506
Memory  | 4GB
Shipped Android Version | 9.0 (Pie)
Internal Storage | 64GB
microSD | Up to 1 TB (dedicated slot)
Battery | 3000 mAh
Dimensions | 157 x 75.3 x 8 mm
Display | 2270 x 1080 pixels, 6.2-inch IPS LCD
Rear Camera  | 12 MP (f/1.8, 1.25µm, PDAF)
Front Camera | 8 MP 1.12µm, HDR

![Motorola g7](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-moto-g7-1.jpg "Motorola g7")

### Kernel Source
To Be Released

### Build with TWRP installer
To auotomatic make the twrp installer, 
you need to import this commit in the build path

```sh
https://gerrit.omnirom.org/#/c/android_build/+/33182/
```
### How to compile

```sh
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch omni_river-eng
mka adbd recoveryimage
```
### Copyright
 ```
  /*
  *  Copyright (C) 2013-19 The OmniROM Project
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
