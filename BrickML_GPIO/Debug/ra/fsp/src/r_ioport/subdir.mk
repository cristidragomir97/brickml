################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra/fsp/src/r_ioport/r_ioport.c 

SREC += \
Barebones.srec 

C_DEPS += \
./ra/fsp/src/r_ioport/r_ioport.d 

OBJS += \
./ra/fsp/src/r_ioport/r_ioport.o 

MAP += \
Barebones.map 


# Each subdirectory must supply rules for building sources it contributes
ra/fsp/src/r_ioport/%.o: ../ra/fsp/src/r_ioport/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RA_CORE=CM33 -D_RENESAS_RA_ -I"/home/cdr/e2_studio/workspace/Barebones/src" -I"/home/cdr/e2_studio/workspace/Barebones/ra/fsp/inc" -I"/home/cdr/e2_studio/workspace/Barebones/ra/fsp/inc/api" -I"/home/cdr/e2_studio/workspace/Barebones/ra/fsp/inc/instances" -I"/home/cdr/e2_studio/workspace/Barebones/ra/fsp/src/rm_freertos_port" -I"/home/cdr/e2_studio/workspace/Barebones/ra/aws/FreeRTOS/FreeRTOS/Source/include" -I"/home/cdr/e2_studio/workspace/Barebones/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"/home/cdr/e2_studio/workspace/Barebones/ra_gen" -I"/home/cdr/e2_studio/workspace/Barebones/ra_cfg/fsp_cfg/bsp" -I"/home/cdr/e2_studio/workspace/Barebones/ra_cfg/fsp_cfg" -I"/home/cdr/e2_studio/workspace/Barebones/ra_cfg/aws" -I"/home/cdr/e2_studio/workspace/Barebones/ra/fsp/src/r_usb_basic/src/driver/inc" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

