#include <main_thread.h>
#include <config.h>
/* New Thread entry function */



/* pvParameters contains TaskHandle_t */
void main_thread_entry(void *pvParameters)
{
    FSP_PARAMETER_NOT_USED (pvParameters);

    /* TODO: add your own code here */
    while (1)
    {

        // led blue off
        g_ioport.p_api->pinWrite( g_ioport.p_ctrl, BLUE_LED, BSP_IO_LEVEL_HIGH  );
                   g_ioport.p_api->pinWrite( g_ioport.p_ctrl, RED_LED, BSP_IO_LEVEL_HIGH  );
                   g_ioport.p_api->pinWrite( g_ioport.p_ctrl, GREEN_LED, BSP_IO_LEVEL_HIGH  );
                   vTaskDelay (500);


            g_ioport.p_api->pinWrite( g_ioport.p_ctrl, BLUE_LED, BSP_IO_LEVEL_LOW );
            vTaskDelay (300);
            g_ioport.p_api->pinWrite( g_ioport.p_ctrl, RED_LED, BSP_IO_LEVEL_LOW );
            vTaskDelay (300);
            g_ioport.p_api->pinWrite( g_ioport.p_ctrl, GREEN_LED, BSP_IO_LEVEL_LOW );
            vTaskDelay (300);




             // sleep


        vTaskDelay (1);
    }
}
