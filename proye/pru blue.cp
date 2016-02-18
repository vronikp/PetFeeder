#line 1 "C:/Users/Javier/Google Drive/lab. microcon/proyecto II/proye/pru blue.c"
#line 1 "c:/users/javier/google drive/lab. microcon/proyecto ii/proye/servir.c"
void alimentar(unsigned short tamanio);
unsigned short qtama (unsigned short kp);
unsigned short teclado (unsigned short kp);
void delay();


unsigned short qtama () {
 unsigned short kp;
 qtama:
#line 19 "c:/users/javier/google drive/lab. microcon/proyecto ii/proye/servir.c"
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
 Lcd_chr(2, 5, kp);


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
 }
 else {
 goto qtama;
 }
 return (kp);
 }

void alimentar(unsigned short tamanio) {
 PWM1_Set_Duty(255);
 PWM1_Start();
 Delay_ms(100);
 PWM1_Stop();
 if (tamanio == 'A'){
 Delay_ms(100);
 }
 else if (tamanio == 'B'){
 Delay_ms(200);
 }
 else if (tamanio == 'C'){
 Delay_ms(300);
 }
 else if (tamanio == 'D'){
 Delay_ms(350);
 }
 PWM1_Set_Duty(30);
 PWM1_Start();
 Delay_ms(100);
 PWM1_Stop();
}

unsigned short ccalimentah () {
unsigned short dig,hora,kp;

ccalimentah:
 dig = 0;
 nonumh:


 do {
 kp = Keypad_Key_Click();
 if (UART1_Data_Ready()){
 kp = UART1_Read();
 goto bluetooth4;
 }
 }while (!kp);

 kp = teclado(kp);
 bluetooth4:
 Lcd_chr(2, 7,kp);
 delay();

 nnumh:
 if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'||kp == '#' ||kp == '*'){

 Lcd_chr(1, 1,'n'); Lcd_chr(1, 2,'o'); Lcd_chr(1, 4,'n'); Lcd_chr(1, 5,'u'); Lcd_chr(1, 6,'m');
 delay();
 goto nonumh;
 }
 else {
 dig++;
 }
 if(dig == 1 && (kp-48) <= 2 ){
 hora = kp-48;
 Lcd_Chr(2, 7, kp);


 do {
 kp = Keypad_Key_Click();
 if (UART1_Data_Ready()){
 kp = UART1_Read();
 goto bluetooth;
 }
 }while (!kp);

 kp = teclado(kp);
 bluetooth:
 Lcd_Chr(2, 7, kp);
 delay();

 if(kp == '#'){
 goto ccalimentah;
 }
 else if (kp == '*'){
 Lcd_Chr(2, 7, (hora+48));
 delay();
 }
 else{
 goto nnumh;
 }
 }
 else if (dig == 2 && (kp-48) <= 4){
 Lcd_chr(2, 7, (hora+48));
 hora = (kp-48)+(10*hora);
 Lcd_chr(2, 8, kp);
 Lcd_chr(2, 10, hora);
 delay();
 }
 else if (dig == 2 && (kp-48) >= 5){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_chr(1, 1,'m'); Lcd_chr(1, 2,'a'); Lcd_chr(1, 3,'x'); Lcd_chr(1, 5,'t');
 delay();
 goto ccalimentah;
 }
 else {
 hora = kp-48;
 Lcd_Chr(2, 7, kp);
 delay();
 }
 return (hora);
}

unsigned short ccalimentam () {
unsigned short dig,minuto,kp;

ccalimentaM:
 dig = 0;
 nonumm:


 do {
 kp = Keypad_Key_Click();
 if (UART1_Data_Ready()){
 kp = UART1_Read();
 goto bluetoothm1;
 }
 }while (!kp);
 kp = teclado(kp);
 bluetoothm1:
 Lcd_chr(2, 7,kp);
 delay();

 nnumm:
 if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'||kp == '#' ||kp == '*'){
 Lcd_chr(1,1,'n'); Lcd_chr(1,2,'o'); Lcd_chr(1,3,'n'); Lcd_chr(1,4,'u'); Lcd_chr(1,5,'m');
 delay();
 goto nonumm;
 }
 else {
 dig++;
 }

 if(dig == 1 && (kp-48) <= 5 && (kp-48) >= 0){
 minuto = kp-48;
 Lcd_Chr(2, 7, kp);


 do {
 kp = Keypad_Key_Click();
 if (UART1_Data_Ready()){
 kp = UART1_Read();
 goto bluetoothm2;
 }
 }while (!kp);
 kp = teclado(kp);
 bluetoothm2:
 Lcd_Chr(2, 7, kp);
 delay();

 if(kp == '#'){
 goto ccalimentam;
 }
 else if (kp == '*'){
 Lcd_Chr(2, 7, (minuto+48));
 delay();
 }
 else{
 goto nnumm;
 }
 }
 else if (dig == 2 && (kp-48) <= 9 && (kp-48) >= 0){
 Lcd_chr(2,7,(minuto+48));
 minuto = (kp-48)+(10*minuto);
 Lcd_chr(2,8,kp);
 Lcd_chr(2,10,minuto);
 delay();
 }
 else {
 minuto = kp-48;
 Lcd_Chr(2, 7, kp);
 delay();
 }
 return(minuto);
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
#line 3 "C:/Users/Javier/Google Drive/lab. microcon/proyecto II/proye/pru blue.c"
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
 hora = ccalimentah ();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, " # de minutos");
 minuto = ccalimentam ();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "# de segundos");
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
