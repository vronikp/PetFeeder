

/*
 * Nombre del Proyecto:
     P10a_usart.c
 * Nombre del Autor:
     (c) Mikroelektronika, 2009.
 * Description:
     (Explicación del ejercicio)
 * Test configuration:
     MCU:             PIC16F887
     Oscillator:      HS, 08.0000 MHz
     SW:              mikroC PRO for PIC

 * NOTES:

*/
unsigned char i;
void main() {
    UART1_Init(19200);            // Initialize USART module
                                  // (8 bit, 19200 baud rate, no parity bit...)
    TRISB=0;
    PORTB=0;
    while (1) {
        if (UART1_Data_Ready()) { // If data has been received
            PORTB = 2;
            i = UART1_Read();     // read it
              if (i == 'o') {
                 PORTB = 1;
              }
              if (i == 'f') {
                 PORTB = 0;
              }
              if (i == '1') {
                 PORTB = 1;
              }
        }
    }
}