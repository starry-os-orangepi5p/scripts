```
# 设置 bootcmd
setenv bootcmd 'echo "Loading Kernel via TFTP, DTB from EXT4..."; \
  pci enmu; \
  tftp ${kernel_addr_r} Uimage; \
  ext4load mmc 0:1 ${fdt_addr_r} /boot/rk3588-orangepi-5-plus.dtb; \
  bootm ${kernel_addr_r} - ${fdt_addr_r}'

# 保存并重启
saveenv
reset
```

加入看门狗：
```
# 设置 bootcmd
setenv bootcmd 'echo "Loading Kernel via TFTP, DTB from EXT4..."; \
  pci enmu; \
  tftp ${kernel_addr_r} Uimage; \
  ext4load mmc 0:1 ${fdt_addr_r} rk3588-orangepi-5-plus.dtb; \
  wdt dev watchdog@feaf0000; \
  wdt start 30000; \
  bootm ${kernel_addr_r} - ${fdt_addr_r}'

# 保存并重启
saveenv
reset
```

```
# 设置 bootcmd
setenv bootcmd 'echo "Loading Kernel via TFTP, DTB from EXT4..."; \
  ext4load mmc 0:1 ${kernel_addr_r} Uimage; \
  ext4load mmc 0:1 ${fdt_addr_r} /boot/rk3588-orangepi-5-plus.dtb; \
  bootm ${kernel_addr_r} - ${fdt_addr_r}'

# 保存并重启
saveenv
reset
```
