# brickML_ADC
This is a guide on how to configure and read the ADC ports on a Renesas RA6-series microcontrollers. 

## Pin Configuration
The pin configuration depends on what pins you want to use. These examples are for the **RA6M5** MCU:
* The **ADC0 Unit** supports pins **P000** to **P015**. 
* The **ADC1 Unit** is a bit more complex, it supports pins:
	* **P000** to **P002** which can overlap with the **ADC0 Unit**
	* **P500** to **P508**
	* **P800** to **P802**

For our example we are going to select **ADC0** and **P003**.
![](https://i.imgur.com/9fbLWsb.png)

![](https://i.imgur.com/WCEXxQ6.png)

## Stack Configuration

From the Stacks panel in the FSP Configurator add a new **r_adc** stack to your project. This can be either added to the **HAL/Common** category or to a specific thread. For simplicity's sake, we added it to **HAL/Common** so that all threads can access it. 

![](https://i.imgur.com/RlluqXb.png)

Now click on properties, and let's configure and edit the settings. 

Most importantly, we need to set the **ADC Unit** that the **r_adc stack** will use. Some pins are connected to the ADC0 Unit and some are connected to the ADC1 unit. You need to set the unit depending on what pins your peripherals are connected to. If you want to use both, you'll need to add two **r_adc** stacks. Since we are going to use **P003** we are going to select **Unit 0**

If you configured your pins correctly, once you select the correct unit, you should see this screen at the bottom of the properties panel. 
![](https://i.imgur.com/aeC3Ryq.png)


Another important setting you'll find here is the **Mode**. There's continuous scan, single scan, and group scan. Because we want to be able to control when the scan occurs, we'll select **Single Scan Mode**.

![](https://i.imgur.com/FpfEa6V.png)

Next up, we'll select what Channels can be read in a single scan:
![](https://i.imgur.com/S5uZ6CJ.png)

At this section, we'll need to give the FSP Configurator the name of the method that it should call when an ADC scan has ended, and set the FreeRTOS priority of that callback:

![](https://i.imgur.com/uOgqn2J.png)

## Code 

### ADC Scan

```cpp
static void startScan(){
    fsp_err_t err;

    err = R_ADC_Open(&g_adc0_ctrl, &g_adc0_cfg);
    if( err == FSP_SUCCESS){
        err = R_ADC_ScanCfg(&g_adc0_ctrl, &g_adc0_channel_cfg);
        if( err == FSP_SUCCESS){
            err = R_ADC_ScanStart(&g_adc0_ctrl);
            R_BSP_SoftwareDelay(1, BSP_DELAY_UNITS_MICROSECONDS);
        }
    }
}
```

### ADC Callback 
```cpp
void adc_callback(adc_callback_args_t *p_args){
    if((NULL != p_args) && (ADC_EVENT_SCAN_COMPLETE == p_args->event)){
        scanEnded = true;
    }
}
```

### Reading ADC
```cpp
static void sampleADC(){
    R_ADC_Read(&g_adc0_ctrl, ADC_CHANNEL_3, &currentReading);
    scanEnded = false;
    ...
    startScan();
}
```