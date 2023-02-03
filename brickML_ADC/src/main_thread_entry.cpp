#include <main_thread.h>
#include <math.h>
#include <serial/serial.h>

#define ICAL 20 // calibration value for current calculation
#define INTERVAL_MS 20
#define CYCLES 1000 / INTERVAL_MS
#define ADC_BITS    12
#define ADC_COUNTS  (1<<ADC_BITS)
#define AREF 3300


volatile bool scanEnded = false;

// variables used for calculating the current root means square
static int cycleCounter = 0;
static uint16_t currentReading;
static float filteredI = 0;
static float offsetI = ADC_COUNTS>>1;
static float sqI, sumI = 0.00;

static double rmsCurrent;

SerialPort USBSerial;

// this gets called when the ADC values are ready
void adc_callback(adc_callback_args_t *p_args){
    if((NULL != p_args) && (ADC_EVENT_SCAN_COMPLETE == p_args->event)){
        scanEnded = true;
    }
}

}

// this initiates an ADC scan
// since we are in single scan mode, we need to do this after every consecutive read
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

static void sampleADC(){
    R_ADC_Read(&g_adc0_ctrl, ADC_CHANNEL_3, &currentReading);
    scanEnded = false;

    offsetI = offsetI + ((currentReading-offsetI)/4096);
    filteredI = currentReading - offsetI;
    sqI = filteredI * filteredI;
    sumI += sqI;
    ++cycleCounter;

    // initiate a new scan when we are ready to process the next sample
    startScan();
}

static double calculateCurrent(){
    double I_RATIO = ICAL *((AREF/1000.0) / (ADC_COUNTS));
    double Irms = I_RATIO * sqrt(sumI / CYCLES);
    sumI = 0;

    return Irms;
}

/* pvParameters contains TaskHandle_t */
void main_thread_entry(void *pvParameters)
{
    FSP_PARAMETER_NOT_USED (pvParameters);

    setupUSB(&USBSerial);
    startScan();

    while (1){
        if(scanEnded) sampleADC();

        if(cycleCounter > CYCLES){
           rmsCurrent = calculateCurrent();
           _printf(&USBSerial, (char *)"RMS Current : %.2f \n", rmsCurrent);
           cycleCounter = 0;
        }


        vTaskDelay (INTERVAL_MS);
    }
}
