# brickML_Serial 
This repo is an example of how to set up and use UART as well as USB Serial on the BrickML Platform.

There are three main components in this repo: 
* `brickML/serial` which contains the serial library. Simply paste it into your `src/` folder.
* `brickML/serial_example`, an example of how to use the serial library
* `brickML/serial_config.xml` is a Renesas FSP configuration that contains all the required stacks and settings for serial communication. You can simply paste this into your E2 Studio solution, and extend it however needed. 

The Renesas RA6M5 MCU has two hardware USB Ports and 10 interfaces that Renesas calls SCI(Serial Communications Interface). These can be configured for I2C, UART, SPI as well as a smart card interface. This guide contains instructions on how to set up SCI0 as an UART Interface. 
## 1. Configuration

After the initial configuration in the last episode **brickML_GPIO** your stack configuration screen should look like this:

![](https://i.imgur.com/40smc7H.png)

For USB Serial support, you'll need to add **USB PCDC (r_usb_pcdc)** and **CRC** to your solution. These stacks need to be added into a thread because they depend on some timer magic that's only available inside the threads. 

To support UART, you'll need to also add **UART (r_sci_uart)** to your solution. If you want more SCI UART ports, just add another instance, and configure their pins accordingly. The **r_sci_uart** stack can be added to the common section, or any thread. It doesn't really (as far as I know)

![](https://i.imgur.com/GchjY1m.png)

### 2.1 USB Stack Configuration 
The  **USB PCDC (r_usb_pcdc)** stack (Peripheral Communication Device Class), doesn't need any particular settings, however, the lower level of the stack **r_usb_basic** driver needs a couple of particular configurations to work on our machine. 

Make sure that your configuration looks like this: 

![](https://i.imgur.com/v6osywu.png)

The most important settings in here are the **USB Module Port** and the **USB RTOS Callback**. To access the MicroUSB port on the brickML MCU daughterboard, use the **USB_IP0** setting. For the Type-C port on the full board, use **USB IP1** Port. 

The **USB RTOS Callback** is the method that FreeRTOS will call upon a new USB connection. 
Set it to `usb_cdc_rtos_callback`. This method can be found in `serial/comms/usb/usb_comms.c`

Global RTOS objects are created from the configuration interface and the E2 IDE will create all the required template code. For the implementation of USB Serial, we'll need a Queue called `g_usb_read_queue` and  a binary semaphore called `g_usb_write_complete_binary_semaphore`

![](https://i.imgur.com/jfDq0t3.png)

The last step we need to take to get the USB serial interface to work is to define it's pins. By default **USB_DP** and **USB_DM** are set, but we'll need to set the **USB_VBUS** pin. Don't worry, you won't have to scroll trough endless pages of schematics for this. It will only give you one option: **P407**. 

![](https://i.imgur.com/0KKLANf.png)

### 2.2 UART Stack Configuration 
The UART Stack configuration is pretty simple compared to the USB part of things. 
You can change the baud rate and classic serial port settings in the properties panel for **g_uart0**. 

![](https://i.imgur.com/IKogO97.png)

Additionally, you'll need to go into the Pin Configuration panel to set up SCI0 to Async UART Mode. 
![](https://i.imgur.com/g4YSQIE.png)

Click on **Generate Project Content** and let's write some code. 
## 2. API

The API for this library is designed so it can be as similar to Arduino as possible. 
The only difference is here everything is static and we need a `SerialPort` struct to contain the mutexes and events for each port. We can bind these structs to the ports we want to use by using the following methods:

```cpp
void setupUART(const uart_instance_t* port, struct SerialPort * settings);
```

```cpp
void setupUSB(struct SerialPort * settings);
```

```cpp
SerialPort USBSerial;
SerialPort SCISerial;

setupUSB(&USBSeria1);
setupUART(&g_uart0, &SCISerial);
```

### Writing to a serial port
```cpp
void write(struct SerialPort * settings, char* str, uint8_t str_len );
```

```cpp
void _printf(struct SerialPort * settings, char* str, ... );
```

### 2.2 Read from Serial Port
```cpp
void read(struct SerialPort * settings, char* str, uint8_t * str_len);
```
This is not implemented yet. 

## 3. Example 
```cpp
#include "main_thread.h"
#include <serial/serial.h>

SerialPort USBSerial;
SerialPort SCISerial;

void main_thread_entry(void *pvParameters){
    setupUSB(&USBSeria1);
    setupUART(&g_uart0, &SCISerial);
    
    while (1){
           _printf(&USBSerial, (char *) "Hello from USB Serial \n");
           vTaskDelay (10);
       }
}
```

## 4. Notes
* Both USB and UART communication is multi-threaded, meaning you can write and read to the ports from any thread in the solution. The only difference is that you'll need a `SerialPort` struct for each thread. Don't worry tho, these are bound to the same global instances, they just create the semaphores needed for mutual execution. 
