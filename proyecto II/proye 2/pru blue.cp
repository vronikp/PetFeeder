#line 1 "C:/Users/PC/Documents/GitHub/PetFeeder/proyecto II/proye 2/pru blue.c"
#line 1 "c:/users/pc/documents/github/petfeeder/proyecto ii/proye 2/servir.c"
void alimentar(unsigned short tamanio);
unsigned short qtama (unsigned short kp);
unsigned short teclado (unsigned short kp);
void delay();


unsigned short qtama () {
 unsigned short kp;
 qtama:

 do {
 kp = Keypad_Key_Click();
 if (UART1_Data_Ready()){
 kp = UART1_Read();
 goto bluetooth1;
 }
 }while (!kp);
 kp = teclado(kp);

 bluetooth1:
 if(kp == 'A' ||kp== 'B' ||kp== 'C'||kp== 'D'){
 Lcd_chr(2, 4, kp);
 do {
 kp = Keypad_Key_Click();
 if (UART1_Data_Ready()){
 kp = UART1_Read();
 goto bluetooth2;
 }
 }while (!kp);
 kp = teclado(kp);

 bluetooth2:
 if(kp == '#'){
 goto qtama;
 }
 if(kp == '*'){
 Lcd_Chr (2,6,'G'); Lcd_Chr (2,7,'u'); Lcd_Chr (2,8,'a'); Lcd_Chr (2,9,'r');Lcd_Chr (2,10,'d');Lcd_Chr (2,11,'a'); Lcd_Chr (2,12,'d'); Lcd_Chr (2,13,'o');
 }
 }else {
 goto qtama;
 }
 return (kp);
 }

void alimentar(unsigned short tama) {
 PWM1_Set_Duty(70);
 PWM1_Start();
 Delay_ms(1000);
 PWM1_Stop();
 if (tama = 65){
 Delay_ms(100);
 }
 else if (tama = 66){
 Delay_ms(150);
 }
 else if (tama = 67){
 Delay_ms(200);
 }
 else if (tama = 68){
 Delay_ms(250);
 }
 PWM1_Set_Duty(50);
 PWM1_Start();
 Delay_ms(1000);
 PWM1_Stop();
}

unsigned short obtenerNumero (unsigned short numeroMax) {
 unsigned short dig,numero,kp;
 volverObtenerNumero:
 dig = 0;
 numero=0;
 Lcd_chr(2, 5, ' '); Lcd_chr(2, 4, ' '); Lcd_chr(2, 3, ' '); Lcd_chr(2, 2, ' '); Lcd_chr(2, 1, ' ');

 leerNumero:
 do {
 kp = Keypad_Key_Click();
 if (UART1_Data_Ready()){
 kp = UART1_Read();
 goto bluetooth4;
 }
 }while (!kp);
 kp = teclado(kp);

 bluetooth4:
 if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'){
 goto leerNumero;
 }else if (kp>=48 && kp<=57) {
 dig++;
 Lcd_chr_Cp(kp);
 numero = (kp-48)+(10*numero);
 }

 if(kp == '#'){
 goto volverObtenerNumero;
 }else if (kp == '*' ){
 Lcd_Chr (2,6,'G'); Lcd_Chr (2,7,'u'); Lcd_Chr (2,8,'a'); Lcd_Chr (2,9,'r');Lcd_Chr (2,10,'d');Lcd_Chr (2,11,'a'); Lcd_Chr (2,12,'d'); Lcd_Chr (2,13,'o');
 delay();
 }else if (numero >= numeroMax){

 Lcd_chr(2, 1,'M'); Lcd_chr(2, 2,'a'); Lcd_chr(2, 3,'x'); Lcd_chr(2, 5,'t');
 delay();
 delay();
 goto volverObtenerNumero;
 }else{
 goto leerNumero;
 }

 return (numero);
}

unsigned short teclado (unsigned short kp) {
 switch (kp) {
 case 1: return 49; break;
 case 2: return 50; break;
 case 3: return 51; break;
 case 4: return 65; break;
 case 5: return 52; break;
 case 6: return 53; break;
 case 7: return 54; break;
 case 8: return 66; break;
 case 9: return 55; break;
 case 10: return 56; break;
 case 11: return 57; break;
 case 12: return 67; break;
 case 13: return 42; break;
 case 14: return 48; break;
 case 15: return 35; break;
 case 16: return 68; break;
 }
}

void delay(){
 delay_ms(500);
}
#line 3 "C:/Users/PC/Documents/GitHub/PetFeeder/proyecto II/proye 2/pru blue.c"
void interrupt();


unsigned short segundos, minutos, horas;
unsigned int counter;
unsigned short kp, hora, minuto, seg, dig, tama;
char txth,txtm,txts;


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

 tama = EEPROM_read(0x01);
 hora = EEPROM_read(0x02);
 minuto = EEPROM_read(0x03);
 seg = EEPROM_read(0x04);

 OPTION_REG = 0x83;
 TMR0 = 131;
 INTCON = 0xA0;
 PORTA = 0;
 TRISA = 0;
 PORTb = 0;
 TRISb = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;
 PWM1_Init(500);
 ANSEL = 0;
 ANSELH = 0;
 UART1_Init(19200);
 Keypad_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
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
 kp =Keypad_Key_Click();
 if (UART1_Data_Ready()){
 kp = 1;
 }
 }while (!kp);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Elija tamaño");
 delay();
 tama = qtama ();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Cada cuanto");
 Lcd_Out(2, 1, "alimentar mascot");
 delay();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Numero de horas");
 hora = obtenerNumero (24);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, " # de minutos");
 minuto = obtenerNumero (60);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "# de segundos");
 seg = obtenerNumero (60);

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
