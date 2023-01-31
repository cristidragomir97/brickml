#include <main_thread.h>
#include <serial/serial.h>

#include <stdio.h>
#include <string.h>
//#include <serial/comms/comms.h>

/* MainThread entry function */

SerialPort SerialPort0;
SerialPort USBSerial;
/* pvParameters contains TaskHandle_t */
void main_thread_entry(void *pvParameters)
{
    FSP_PARAMETER_NOT_USED (pvParameters);

   setupUART(&g_uart0, &SerialPort0);
   setupUSB(&USBSerial);

    /* TODO: add your own code here */
    while (1)
    {

        _printf(&SerialPort0, (char *) "Hello World from Serial !\n");
        _printf(&USBSerial, (char *) "Hello World from USB !\n");

        vTaskDelay (100);
    }
}
