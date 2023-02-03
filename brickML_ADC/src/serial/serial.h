
#include <serial/comms/comms.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdint.h>
#include <string.h>
#include "r_uart_api.h"
#include "event_groups.h"
#include "semphr.h"
#include "hal_data.h"

#ifdef __cplusplus
extern "C" {
#endif

struct SerialPort {
    const uart_instance_t* port;
    EventGroupHandle_t uart_event_handle;
    StaticEventGroup_t uart_event_buf;
    StaticSemaphore_t mutex_buf;
    SemaphoreHandle_t mutex_handle;

};


void setupUART(const uart_instance_t* port, struct SerialPort * settings);
void setupUSB(struct SerialPort * settings);
void write(struct SerialPort * settings, char* str, uint8_t str_len );
void read(struct SerialPort * settings, char* str, uint8_t * str_len);
void _printf(struct SerialPort * settings, char* str, ... );


#ifdef __cplusplus
}
#endif
