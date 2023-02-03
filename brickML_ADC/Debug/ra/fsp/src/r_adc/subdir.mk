################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra/fsp/src/r_adc/r_adc.c 

SREC += \
brickML_ADC.srec 

C_DEPS += \
./ra/fsp/src/r_adc/r_adc.d 

OBJS += \
./ra/fsp/src/r_adc/r_adc.o 

MAP += \
brickML_ADC.map 


# Each subdirectory must supply rules for building sources it contributes
ra/fsp/src/r_adc/%.o: ../ra/fsp/src/r_adc/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RENESAS_RA_ -D_RA_CORE=CM33 -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/src" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/inc" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/inc/api" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/inc/instances" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/src/rm_freertos_port" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/aws/FreeRTOS/FreeRTOS/Source/include" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_gen" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_cfg/fsp_cfg/bsp" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_cfg/fsp_cfg" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_cfg/aws" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/src/r_usb_basic/src/driver/inc" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

