#include "servir.c"

void interrupt();


unsigned short segundos, minutos, horas;
unsigned int counter;
unsigned short kp, hora, minuto, seg, dig, tama;
char txth,txtm,txts;

// Keypad module connections
char  keypadPort at PORTD;
// End Keypad module connections

// LCD module connections
sbit LCD_RS at RA4_bit;
sbit LCD_EN at RA5_bit;
sbit LCD_D4 at RA0_bit;
sbit LCD_D5 at RA1_bit;
sbit LCD_D6 at RA2_bit;
sbit LCD_D7 at RA3_bit;

sbit LCD_RS_Direction at TRISA4_bit;
sbit LCD_EN_Direction at TRISA5_bit;
sbit LCD_D4_Direction at TRISA0_bit;
sbit LCD_D5_Direction at TRISA1_bit;
sbit LCD_D6_Direction at TRISA2_bit;
sbit LCD_D7_Direction at TRISA3_bit;
// End LCD module connections

void main() {

  //tama = EEPROM_read(0x01);
  //hora = EEPROM_read(0x02);
  //minuto = EEPROM_read(0x03);
 // seg = EEPROM_read(0x04);

  OPTION_REG = 0x83;             // Set timer TMR0
  TMR0 = 131;
  INTCON = 0xA0;                 // Disable interrupt PEIE,INTE,RBIE,T0IE
  PORTA = 0;                     // Turn off both displays
  TRISA = 0;                     // All port A pins are configured as outputs
  PORTb = 0;                     // Turn off both displays
  TRISb = 0;
  C1ON_bit = 0;                       // Disable comparators
  C2ON_bit = 0;
  PWM1_Init(500);
  ANSEL = 0;
  ANSELH = 0;
  UART1_Init(19200);
  Keypad_Init();                           // Initialize Keypad
  Lcd_Init();                              // Initialize Lcd
  Lcd_Cmd(_LCD_CLEAR);                      // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);                 // Cursor off
  counter = 0;
  segundos = 0;
  minutos = 0;
  horas = 0;
  kp = 0;
  


  do{
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out(1, 1, "Hola ");
      Lcd_Out(2, 1, "Pres una tecla");
      do {
      kp =Keypad_Key_Click();             // Store key code in kp variable
      if (UART1_Data_Ready()){
         kp = 1;
         }
      }while (!kp);
  
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "Elija tamaño");
  delay();
  tama = qtama ();
  
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "Cada cuanto");                 // Write message text on Lcd
  Lcd_Out(2, 1, "alimentar mascot");
  delay();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "Numero de horas");                 // Write message text on Lcd
  hora = ccalimentah ();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, " # de minutos");                 // Write message text on Lcd
  minuto = ccalimentam ();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "# de segundos");                 // Write message text on Lcd
  seg = ccalimentam ();
 
  EEPROM_Write(0x01,tama);
  EEPROM_Write(0x02,hora);
  EEPROM_Write(0x03,minuto);
  EEPROM_Write(0x04,seg);
  counter = 0;
  segundos = 0;
  minutos = 0;
  horas = 0;
  }while (1);
}

void interrupt() {
    if (INTCON.TMR0IF) {
     counter++;
      if (counter == 1000) {
       counter =0;
       segundos++;
       portb++;
       if (segundos == 60) {
        segundos = 0;
        minutos++;
         if (minutos == 60) {
          minutos = 0;
          horas++;
          }
        }
       }
     if (segundos==seg && minutos==minuto && horas==hora) {
        alimentar(tama);
          counter = 0;
          segundos = 0;
          minutos = 0;
          horas = 0;
      }
     }
     INTCON.TMR0IF = 0;
     TMR0 = 130;
}