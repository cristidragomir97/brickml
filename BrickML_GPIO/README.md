# BrickML_GPIO 

### 1. Create project
* Open **New C/C++ Project** in E2 Studio
* Select **R7FA6M5BF2CBG** for Device, make sure FSP Version is 4.0.0 and  language is C++
* Select **Project Type: Flat**
* Select **FreeRTOS (v10.4.6+fsp.4.0.0)**
* Select **FreeRTOS - Minimal - Static Allocation**
	Note: We won't actually use Static Allocation but this needs to be updated later. 

### 2. Configure MCU, FPS and FreeRTOS
After the initial project setup, E2 is going to open a configuration page that will look like this. We'll have to do some changes here to get our project ready to blink.  

![](https://i.ibb.co/s5FHs7T/Screenshot-from-2023-01-10-15-00-34.png)

#### 2.1 Clocks 
Make sure the clocks page looks like this, and please don't ask me why. I just know we need the **48MHz UCLK** clock source for USB to work. And we'll need that for Serial later. 
![](https://i.ibb.co/CwMNSvy/Screenshot-from-2023-01-10-15-01-17.png)
#### 2.2 Stacks 
Now here comes the fun part.  Renesas organises functionality into Stacks. Those are kind of a weird combination between  FreeRTOS and it's configs, the Hardware Abstraction Layer and the threading model (at least from what I understand now. We can also define our threads and shared objects here, and template code will be generated.

Let's start with the blank configuration. Oh and from the menu in Eclipse, make sure that the properties view is enabled. A lot of useful secrets are buried in there.  (Window > Show View > Properties)
 
![](https://i.ibb.co/GxYP2b4/Screenshot-from-2023-01-10-15-21-28.png)

First we need to create a new thread. For this project we'll only need one, the **Main Thread**. 
Click on **"New Thread"** button, select the newly created thread.  Before we go any further, we need to change some settings.

First we need to change the memory allocation scheme to dynamic. This is basically what enables us to do multi-threading on the MCU. Under **Common/Memory Allocation** we need to enable **Support Dynamic Memory Allocation**. We'll leave **Support Static Memory Allocation** selected just in case we'll ever add some more *legacy* code that needs that. 
These settings, altho placed here, are applied to FreeRTOS itself not only the current thread. 

![](https://i.ibb.co/VWNsfVL/Screenshot-from-2023-01-10-15-35-08.png)

Next up, on the thread settings, we need to give it a **Name** and **Symbol**, define it's **Stack Size**, and **Memory Allocation Scheme**. Additionally,  you can also set the priority of the thread here, which is useful for threads that are doing data acquisition. 

![](https://i.ibb.co/gPkTqz1/Screenshot-from-2023-01-11-08-32-35.png)

Now,  multithreading on FreeRTOS we need to select a memory management scheme. This is a copy-pasta overview of the memory management schemes available. 
-   [heap_1](https://www.freertos.org/a00111.html#heap_1)  - the very simplest, does not permit memory to be freed.
-   [heap_2](https://www.freertos.org/a00111.html#heap_2)  - permits memory to be freed, but does not coalescence adjacent free blocks.
-   [heap_3](https://www.freertos.org/a00111.html#heap_3)  - simply wraps the standard malloc() and free() for thread safety.
-   [heap_4](https://www.freertos.org/a00111.html#heap_4)  - coalescences adjacent free blocks to avoid fragmentation. Includes absolute address placement option.
-   [heap_5](https://www.freertos.org/a00111.html#heap_5)  - as per heap_4, with the ability to span the heap across multiple non-adjacent memory areas.

For our purposes, and simplicity, I guess **heap_4** and **heap_5** are the best option. Let's add heap_4 as a stack, and finish this part of the configuration. 

![](https://i.ibb.co/FhrnPPB/Screenshot-from-2023-01-11-08-36-10.png)

#### 2.4 Pins 
The last step to get our RA6 MCU ready to blink, is to tell the pinmux about the pins we want to use. 

The Reloc Board/Kit/Whatever has a RGB LED and a button on the board. They are connected to the following pins. 

```c
#define BLUE_LED BSP_IO_PORT_00_PIN_07
#define GREEN_LED  BSP_IO_PORT_06_PIN_02
#define RED_LED BSP_IO_PORT_00_PIN_01
#define USER_SWITCH BSP_IO_PORT_01_PIN_06
```
From the **Pins** tab, navigate to each one of these pins and set the mode to **OUTPUT (Initial Low)**. 

![](https://i.ibb.co/Hh46bbD/Screenshot-from-2023-01-11-09-00-09.png)

And that's about it for the configuration, press **Generate Project Content**, and build the project. If everything works well, your build should succeed, if it doesn't it's probably because of something you configured here. 

Between different configurations, it's a good practice to clean the project and then remove the **ra** and **ra_gen** folders. 

Anyway, here's blinky. 

#### 3. To be continued 
For now, I just added the blinky example. But soon, this repo will contain the complete boilerplate for doing anything GPIO related on the RA6 platform. 

* Buttons and interrupts
* ADC 
* PWM
