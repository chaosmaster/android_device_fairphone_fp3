TWRP device tree for Fairphone 3
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
microSD | Up to 400GB (dedicated slot)
Battery | 3000 mAh
Dimensions | 158 x 71.8 x 9.89 mm
Display | 2270 x 1080 pixels, 5.65-inch IPS LCD
Rear Camera  | 12 MP (f/1.8, 1/2.55", PDAF)
Front Camera | 8 MP (f/2.0, 1/4", HDR)

### Kernel Source
https://code.fairphone.com/projects/fairphone-3-gpl.html

### Build with TWRP installer
For proper (SAR)-mounting of the system-partition, pick this:
```sh
https://gerrit.twrp.me/c/android_bootable_recovery/+/1807
```

To automatically build the twrp-installer, pick this:

```sh
https://gerrit.omnirom.org/#/c/android_build/+/33182/
```
### How to compile

```sh
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
lunch omni_fp3-eng
mka recoveryimage
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
