#line 1 "C:/Users/Javier/Google Drive/lab. microcon/proyecto II/blue/pru blue.c"
#line 17 "C:/Users/Javier/Google Drive/lab. microcon/proyecto II/blue/pru blue.c"
unsigned short kp, cnt, oldstate = 0;
char txt[4];


char keypadPort at PORTD;



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


void main() {
 ANSEL = 0;
 ANSELH = 0;
 cnt = 0;
 TRISB=0;
 PORTB=0;
 UART1_Init(19200);
 Keypad_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 4, "John");
 Lcd_Out(2, 3, "Colina");
 delay_ms(4000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Key  :");
 Lcd_Out(2, 1, "Times:");

 do {
 kp = 0;


 do {

 kp = Keypad_Key_Click();
 if (UART1_Data_Ready()){
 kp = UART1_Read();
 goto bluetooth;
 }
 }while (!kp);

 switch (kp) {





 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;
 case 4: kp = 65; break;
 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;
 case 8: kp = 66; break;
 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;
 case 12: kp = 67; break;
 case 13: kp = 42; break;
 case 14: kp = 48; break;
 case 15: kp = 35; break;
 case 16: kp = 68; break;

 }
 bluetooth:
 if (kp != oldstate) {
 cnt = 1;
 oldstate = kp;
 }
 else {
 cnt++;
 }

 Lcd_Chr(1, 10, kp);

 if (cnt == 255) {
 cnt = 0;
 Lcd_Out(2, 10, "   ");
 }

 ByteToStr(cnt, txt);
 Lcd_Out(2, 10, txt);
 } while (1);
}
