################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/hal_entry.cpp \
../src/main_thread_entry.cpp 

SREC += \
Serial.srec 

OBJS += \
./src/hal_entry.o \
./src/main_thread_entry.o 

MAP += \
Serial.map 

CPP_DEPS += \
./src/hal_entry.d \
./src/main_thread_entry.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RA_CORE=CM33 -D_RENESAS_RA_ -I"/home/cdr/e2_studio/workspace/Serial/src" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/inc" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/inc/api" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/inc/instances" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/src/rm_freertos_port" -I"/home/cdr/e2_studio/workspace/Serial/ra/aws/FreeRTOS/FreeRTOS/Source/include" -I"/home/cdr/e2_studio/workspace/Serial/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"/home/cdr/e2_studio/workspace/Serial/ra_gen" -I"/home/cdr/e2_studio/workspace/Serial/ra_cfg/fsp_cfg/bsp" -I"/home/cdr/e2_studio/workspace/Serial/ra_cfg/fsp_cfg" -I"/home/cdr/e2_studio/workspace/Serial/ra_cfg/aws" -I"/home/cdr/e2_studio/workspace/Serial/ra/fsp/src/r_usb_basic/src/driver/inc" -std=c++11 -fabi-version=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<")
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"

