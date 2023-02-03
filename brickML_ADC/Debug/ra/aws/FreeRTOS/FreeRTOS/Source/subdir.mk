################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra/aws/FreeRTOS/FreeRTOS/Source/event_groups.c \
../ra/aws/FreeRTOS/FreeRTOS/Source/list.c \
../ra/aws/FreeRTOS/FreeRTOS/Source/queue.c \
../ra/aws/FreeRTOS/FreeRTOS/Source/stream_buffer.c \
../ra/aws/FreeRTOS/FreeRTOS/Source/tasks.c \
../ra/aws/FreeRTOS/FreeRTOS/Source/timers.c 

SREC += \
brickML_ADC.srec 

C_DEPS += \
./ra/aws/FreeRTOS/FreeRTOS/Source/event_groups.d \
./ra/aws/FreeRTOS/FreeRTOS/Source/list.d \
./ra/aws/FreeRTOS/FreeRTOS/Source/queue.d \
./ra/aws/FreeRTOS/FreeRTOS/Source/stream_buffer.d \
./ra/aws/FreeRTOS/FreeRTOS/Source/tasks.d \
./ra/aws/FreeRTOS/FreeRTOS/Source/timers.d 

OBJS += \
./ra/aws/FreeRTOS/FreeRTOS/Source/event_groups.o \
./ra/aws/FreeRTOS/FreeRTOS/Source/list.o \
./ra/aws/FreeRTOS/FreeRTOS/Source/queue.o \
./ra/aws/FreeRTOS/FreeRTOS/Source/stream_buffer.o \
./ra/aws/FreeRTOS/FreeRTOS/Source/tasks.o \
./ra/aws/FreeRTOS/FreeRTOS/Source/timers.o 

MAP += \
brickML_ADC.map 


# Each subdirectory must supply rules for building sources it contributes
ra/aws/FreeRTOS/FreeRTOS/Source/%.o: ../ra/aws/FreeRTOS/FreeRTOS/Source/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal  -g -gdwarf-4 -D_RENESAS_RA_ -D_RA_CORE=CM33 -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/src" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/inc" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/inc/api" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/inc/instances" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/src/rm_freertos_port" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/aws/FreeRTOS/FreeRTOS/Source/include" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/arm/CMSIS_5/CMSIS/Core/Include" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_gen" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_cfg/fsp_cfg/bsp" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_cfg/fsp_cfg" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra_cfg/aws" -I"C:/Users/crist/e2_studio/workspace2/brickML_ADC/ra/fsp/src/r_usb_basic/src/driver/inc" -std=c99 -w -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

