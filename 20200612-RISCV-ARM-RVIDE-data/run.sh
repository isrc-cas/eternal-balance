riscv32-unknown-elf-gcc -march=rv32imac -mabi=ilp32 -mcmodel=medlow -msmall-data-limit=8 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -I"./Application" -I"./Utilities/LCD_common" -I"./Peripherals/Include" -I"./Peripherals" -I"./RISCV/drivers" -I"./Utilities" -I"./Application" -I"./"  -c "./Application/main.c" -o "Application/main.o"

riscv32-unknown-elf-gcc -march=rv32imac -mabi=ilp32 -mcmodel=medlow -msmall-data-limit=8 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -I"./RISCV/env_Eclipse" -I"./Utilities/LCD_common" -I"./Peripherals/Include" -I"./Peripherals" -I"./RISCV/drivers" -I"./Utilities" -I"./Application" -I"./"  -c "./RISCV/env_Eclipse/your_printf.c" -o "RISCV/env_Eclipse/your_printf.o"

riscv32-unknown-elf-ld "Application/main.o" "RISCV/env_Eclipse/your_printf.o" -melf32lriscv --start-group -lstdc++_nano -lm -lg_nano -lgcc -lc_nano -lperipherals --end-group --gc-sections -o "a2.out" -T"./Running_Led.lds" -L$RISCV32GCC8_3_0/riscv32-unknown-elf/lib -L$RISCV32GCC8_3_0/riscv32-unknown-elf/lib/rv32imac/ilp32 -L"./" -L$RISCV32GCC8_3_0/lib/gcc/riscv32-unknown-elf/8.3.0/rv32imac/ilp32



 
 
