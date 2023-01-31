/* generated vector header file - do not edit */
#ifndef VECTOR_DATA_H
#define VECTOR_DATA_H
#ifdef __cplusplus
        extern "C" {
        #endif
/* Number of interrupts allocated */
#ifndef VECTOR_DATA_IRQ_COUNT
#define VECTOR_DATA_IRQ_COUNT    (9)
#endif
/* ISR prototypes */
void sci_uart_rxi_isr(void);
void sci_uart_txi_isr(void);
void sci_uart_tei_isr(void);
void sci_uart_eri_isr(void);
void usbfs_interrupt_handler(void);
void usbfs_resume_handler(void);
void usbfs_d0fifo_handler(void);
void usbfs_d1fifo_handler(void);
void usbhs_interrupt_handler(void);

/* Vector table allocations */
#define VECTOR_NUMBER_SCI0_RXI ((IRQn_Type) 0) /* SCI0 RXI (Receive data full) */
#define SCI0_RXI_IRQn          ((IRQn_Type) 0) /* SCI0 RXI (Receive data full) */
#define VECTOR_NUMBER_SCI0_TXI ((IRQn_Type) 1) /* SCI0 TXI (Transmit data empty) */
#define SCI0_TXI_IRQn          ((IRQn_Type) 1) /* SCI0 TXI (Transmit data empty) */
#define VECTOR_NUMBER_SCI0_TEI ((IRQn_Type) 2) /* SCI0 TEI (Transmit end) */
#define SCI0_TEI_IRQn          ((IRQn_Type) 2) /* SCI0 TEI (Transmit end) */
#define VECTOR_NUMBER_SCI0_ERI ((IRQn_Type) 3) /* SCI0 ERI (Receive error) */
#define SCI0_ERI_IRQn          ((IRQn_Type) 3) /* SCI0 ERI (Receive error) */
#define VECTOR_NUMBER_USBFS_INT ((IRQn_Type) 4) /* USBFS INT (USBFS interrupt) */
#define USBFS_INT_IRQn          ((IRQn_Type) 4) /* USBFS INT (USBFS interrupt) */
#define VECTOR_NUMBER_USBFS_RESUME ((IRQn_Type) 5) /* USBFS RESUME (USBFS resume interrupt) */
#define USBFS_RESUME_IRQn          ((IRQn_Type) 5) /* USBFS RESUME (USBFS resume interrupt) */
#define VECTOR_NUMBER_USBFS_FIFO_0 ((IRQn_Type) 6) /* USBFS FIFO 0 (DMA transfer request 0) */
#define USBFS_FIFO_0_IRQn          ((IRQn_Type) 6) /* USBFS FIFO 0 (DMA transfer request 0) */
#define VECTOR_NUMBER_USBFS_FIFO_1 ((IRQn_Type) 7) /* USBFS FIFO 1 (DMA transfer request 1) */
#define USBFS_FIFO_1_IRQn          ((IRQn_Type) 7) /* USBFS FIFO 1 (DMA transfer request 1) */
#define VECTOR_NUMBER_USBHS_USB_INT_RESUME ((IRQn_Type) 8) /* USBHS USB INT RESUME (USBHS interrupt) */
#define USBHS_USB_INT_RESUME_IRQn          ((IRQn_Type) 8) /* USBHS USB INT RESUME (USBHS interrupt) */
#ifdef __cplusplus
        }
        #endif
#endif /* VECTOR_DATA_H */
