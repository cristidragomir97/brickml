################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra/fsp/src/r_usb_basic/src/hw/r_usb_creg_abs.c \
../ra/fsp/src/r_usb_basic/src/hw/r_usb_creg_access.c \
../ra/fsp/src/r_usb_basic/src/hw/r_usb_dma.c \
../ra/fsp/src/r_usb_basic/src/hw/r_usb_hostelectrical.c \
../ra/fsp/src/r_usb_basic/src/hw/r_usb_hreg_abs.c \
../ra/fsp/src/r_usb_basic/src/hw/r_usb_hreg_access.c \
../ra/fsp/src/r_usb_basic/src/hw/r_usb_mcu.c \
../ra/fsp/src/r_usb_basic/src/hw/r_usb_preg_abs.c \
../ra/fsp/src/r_usb_basic/src/hw/r_usb_preg_access.c 

SREC += \
Serial.srec 

C_DEPS += \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_creg_abs.d \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_creg_access.d \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_dma.d \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_hostelectrical.d \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_hreg_abs.d \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_hreg_access.d \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_mcu.d \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_preg_abs.d \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_preg_access.d 

OBJS += \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_creg_abs.o \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_creg_access.o \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_dma.o \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_hostelectrical.o \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_hreg_abs.o \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_hreg_access.o \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_mcu.o \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_preg_abs.o \
./ra/fsp/src/r_usb_basic/src/hw/r_usb_preg_access.o 

MAP += \
Serial.map 


# Each subdirectory must supply rules for building sources it contributes
ra/fsp/src/r_usb_basic/src/hw/%.o: ../ra/fsp/src/r_usb_basic/src/hw/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RA_CORE=CM33 -D_RENESAS_RA_ -I"/home/cdr/e2_studio/workspace/Serial/src" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/inc" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/inc/api" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/inc/instances" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/src/rm_freertos_port" -I"/home/cdr/e2_studio/workspace/Serial/ra/aws/FreeRTOS/FreeRTOS/Source/include" -I"/home/cdr/e2_studio/workspace/Serial/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"/home/cdr/e2_studio/workspace/Serial/ra_gen" -I"/home/cdr/e2_studio/workspace/Serial/ra_cfg/fsp_cfg/bsp" -I"/home/cdr/e2_studio/workspace/Serial/ra_cfg/fsp_cfg" -I"/home/cdr/e2_studio/workspace/Serial/ra_cfg/aws" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/src/r_usb_basic/src/driver/inc" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

