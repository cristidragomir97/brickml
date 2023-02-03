# BrickML + EdgeImpulse
This repository is a collection of Zalmotek's examples and experiments about integrating the Renesas RA6 family of microcontrollers with Edge Impulse. 
Every one of this projects contains the code itself as well step-by-step guides about how to use the **Renesas FSP Configurator** to get the required functionality. 

* **BrickML_GPIO** is a a barebones example, similar to Arduino's blink. 
* **BrickML_Serial** wraps the USB CDC and UART functionality into a single package for Serial comunication.
* **BrickML_ADC** is an example for the ADC functionality used for reading a [Non Invasive Current Sensor](https://www.sparkfun.com/products/11005)
* **BrickML_Inference** is a multithreaded example, containg a sensor aquisition thread that reads the values from a BNO055 motion sensors, and another that runs a a continuous motion classification model. 

TODO:
* Add **BrickML_I2C**
* Update **BrickML_Inference** with ADC code (will be done after training the sensor-fusion model)
* Bluetooth, LTE, Ethernet
