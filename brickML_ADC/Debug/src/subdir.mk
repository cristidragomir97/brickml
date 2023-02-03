################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/hal_entry.cpp \
../src/main_thread_entry.cpp 

SREC += \
brickML_ADC.srec 

OBJS += \
./src/hal_entry.o \
./src/main_thread_entry.o 

MAP += \
brickML_ADC.map 

CPP_DEPS += \
./src/hal_entry.d \
./src/main_thread_entry.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RENESAS_RA_ -D_RA_CORE=CM33 -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/src" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/inc" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/inc/api" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/inc/instances" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/src/rm_freertos_port" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/aws/FreeRTOS/FreeRTOS/Source/include" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_gen" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_cfg/fsp_cfg/bsp" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_cfg/fsp_cfg" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_cfg/aws" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/src/r_usb_basic/src/driver/inc" -std=c++11 -fabi-version=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<")
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"

