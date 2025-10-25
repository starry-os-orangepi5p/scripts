TFTP方式
```
# 设置 bootcmd
setenv bootcmd 'echo "Loading Kernel and DTB from TFTP..."; \
  pci enum; \
  mmc dev 1; \
  mmc part; \
  tftp ${kernel_addr_r} Uimage; \
  tftp ${fdt_addr_r} rk3588-orangepi-5-plus.dtb; \
  bootm ${kernel_addr_r} - ${fdt_addr_r}'

# 保存并重启
saveenv
reset
```

ext4load方式
```
setenv bootcmd 'echo "Loading Kernel and DTB from EXT4..."; \
  ext4load mmc 1:1 ${fdt_addr_r} boot/rk3588-orangepi-5-plus.dtb; \
  ext4load mmc 1:1 ${kernel_addr_r} boot/starry-mix_aarch64-opi5p.uimg; \
  bootm ${kernel_addr_r} - ${fdt_addr_r};'

# 保存并重启
saveenv
reset
```

加入看门狗：
```
# 设置 bootcmd
setenv bootcmd 'echo "Loading Kernel via TFTP, DTB from EXT4..."; \
  pci enum; \
  mmc dev 1; \
  mmc part; \
  tftp ${kernel_addr_r} Uimage; \
  tftp ${fdt_addr_r} rk3588-orangepi-5-plus.dtb; \
  wdt dev watchdog@feaf0000; \
  wdt start 30000; \
  bootm ${kernel_addr_r} - ${fdt_addr_r}'

# 保存并重启
saveenv
reset
```

origin
```
setenv bootcmd 'bootflow scan -lb'
saveenv
reset
```
