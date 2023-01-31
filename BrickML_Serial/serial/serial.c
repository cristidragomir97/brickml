#include <serial/serial.h>

#include <serial/comms/comms.h>

/*
static volatile uart_event_t g_uart0_event = 0;
static volatile bool g_timer0_event = false;
#define TRACE_WAIT_TIMEOUT_TICKS 1000

void g_timer0_callback(timer_callback_args_t *p_args)
{
    FSP_PARAMETER_NOT_USED(p_args);

    g_timer0_event = true;
}

void user_uart_callback(uart_callback_args_t *p_args)
{
    g_uart0_event = p_args->event;
}

*/

void setupUART(const uart_instance_t * _port, struct SerialPort * settings) {
    settings -> port = _port;
    settings -> uart_event_handle = xEventGroupCreateStatic( & settings -> uart_event_buf);
    settings -> mutex_handle = xSemaphoreCreateMutexStatic( & settings -> mutex_buf);
    settings -> port -> p_api -> open(settings -> port -> p_ctrl, settings -> port -> p_cfg);
}

void setupUSB(struct SerialPort * settings) {
    settings -> uart_event_handle = xEventGroupCreateStatic( & settings -> uart_event_buf);
    settings -> mutex_handle = xSemaphoreCreateMutexStatic( & settings -> mutex_buf);

    fsp_err_t err = FSP_SUCCESS;

    /* Open USB instance */
    err = comms_open();
    if (FSP_SUCCESS != err) {
        /* Stop as comms close failure */
        return;
    }

}

void write(struct SerialPort * settings, char * str, uint8_t str_len) {
    if (settings -> port == NULL) {

        if (pdTRUE == xSemaphoreTake(settings -> mutex_handle, 1)) {

            fsp_err_t err = FSP_SUCCESS;

            err = comms_send(str, str_len, 0); // portMAX_DELAY);
            if (err == FSP_SUCCESS) {

            } else {

            }

            xSemaphoreGive(settings -> mutex_handle);
        }
    } else {
        if (pdTRUE == xSemaphoreTake(settings -> mutex_handle, 1)) {
            fsp_err_t err;

            err = settings -> port -> p_api -> write(settings -> port -> p_ctrl, (uint8_t * ) str, str_len);

            if (err == FSP_SUCCESS) {
                xEventGroupWaitBits(settings -> uart_event_handle,
                    (1 << UART_EVENT_TX_COMPLETE),
                    pdTRUE,
                    pdFALSE,
                    1);
            }
            xSemaphoreGive(settings -> mutex_handle);
        }
    }

}


void read(struct SerialPort * settings, char * str, uint8_t * str_len) {
    /*
    if (settings -> port == NULL) {
        if (pdTRUE == xSemaphoreTake(settings -> mutex_handle, 1)) {

            xSemaphoreGive(settings -> mutex_handle);
        }
    } else {
        if (pdTRUE == xSemaphoreTake(settings -> mutex_handle, TRACE_WAIT_TIMEOUT_TICKS)) {
            fsp_err_t err;

            if (NO_TIMEOUT != timeout_milliseconds) {
                err = g_timer0.p_api -> stop(g_timer0.p_ctrl);
                if (FSP_SUCCESS != err) {
                    return err;
                }

                err = g_timer0.p_api -> periodSet(g_timer0.p_ctrl, (RAW_COUNT_MS * timeout_milliseconds));
                if (FSP_SUCCESS != err) {
                    return err;
                }

                g_timer0_event = false;
                err = g_timer0.p_api -> start(g_timer0.p_ctrl);
                if (FSP_SUCCESS != err) {
                    return err;
                }
            } else {
                g_timer0_event = false;
            }

            g_uart0_event = 0;
            err = g_uart0.p_api -> read(g_uart0.p_ctrl, str, * str_len);
            if (FSP_SUCCESS == err) {
                while ((UART_EVENT_RX_COMPLETE != g_uart0_event) && (true != g_timer0_event)) {
                    ;
                }
            }

            err = g_timer0.p_api -> stop(g_timer0.p_ctrl);
            if (FSP_SUCCESS != err) {
                return err;
            }

            if (false == g_timer0_event) {
                return FSP_SUCCESS;
            } else {
                return FSP_ERR_TIMEOUT;
            }
            xSemaphoreGive(settings -> mutex_handle);
        }
    }
    */
}



void _printf(struct SerialPort * settings, char * str, ...) {
    va_list ap;
    char buf[128] = {0};
    va_start(ap, str);
    vsnprintf(buf, sizeof(buf), str, ap);
    va_end(ap);
    write(settings, buf, strlen(buf));
}
