################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra_gen/common_data.c \
../ra_gen/hal_data.c \
../ra_gen/main.c \
../ra_gen/main_thread.c \
../ra_gen/pin_data.c \
../ra_gen/vector_data.c 

SREC += \
Serial.srec 

C_DEPS += \
./ra_gen/common_data.d \
./ra_gen/hal_data.d \
./ra_gen/main.d \
./ra_gen/main_thread.d \
./ra_gen/pin_data.d \
./ra_gen/vector_data.d 

OBJS += \
./ra_gen/common_data.o \
./ra_gen/hal_data.o \
./ra_gen/main.o \
./ra_gen/main_thread.o \
./ra_gen/pin_data.o \
./ra_gen/vector_data.o 

MAP += \
Serial.map 


# Each subdirectory must supply rules for building sources it contributes
ra_gen/%.o: ../ra_gen/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RA_CORE=CM33 -D_RENESAS_RA_ -I"/home/cdr/e2_studio/workspace/Serial/src" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/inc" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/inc/api" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/inc/instances" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/src/rm_freertos_port" -I"/home/cdr/e2_studio/workspace/Serial/ra/aws/FreeRTOS/FreeRTOS/Source/include" -I"/home/cdr/e2_studio/workspace/Serial/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"/home/cdr/e2_studio/workspace/Serial/ra_gen" -I"/home/cdr/e2_studio/workspace/Serial/ra_cfg/fsp_cfg/bsp" -I"/home/cdr/e2_studio/workspace/Serial/ra_cfg/fsp_cfg" -I"/home/cdr/e2_studio/workspace/Serial/ra_cfg/aws" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/src/r_usb_basic/src/driver/inc" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"
