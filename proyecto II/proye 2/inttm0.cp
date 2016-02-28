#line 1 "C:/Users/Javier/Google Drive/lab. microcon/proyecto II/proye/inttm0.c"

unsigned short segundos, minutos, horas;
unsigned int counter;

void alimentar(unsigned short tamanio) {
 PWM1_Start();
 PWM1_Set_Duty(255);
 Delay_ms(750);
 PWM1_Stop();
 if (tamanio == 'A'){
 Delay_ms(500);
 }
 else if (tamanio == 'B'){
 Delay_ms(1500);
 }
 else if (tamanio == 'C'){
 Delay_ms(2000);
 }
 else if (tamanio == 'D'){
 Delay_ms(2500);
 }
 PWM1_Start();
 PWM1_Set_Duty(30);
 Delay_ms(750);
 PWM1_Stop();
}

void interrupt() {
 if (INTCON.TMR0IF) {
 counter++;
 TMR0 = 131;
 INTCON.TMR0IF = 0;
 if (counter = 1000) {
 counter =0;
 segundos++;
 if (segundos = 60) {
 segundos = 0;
 minutos++;
 if (minutos = 60) {
 minutos = 0;
 horas++;
 }
 }
 }
 if (segundos==EEPROM_Read(0x02) && minutos==EEPROM_Read(0x03) && horas==EEPROM_Read(0x04)) {
 alimentar(EEPROM_Read(0x01));
 }
 }

}


void main() {
 OPTION_REG = 0x83;
 TMR0 = 131;
 INTCON = 0xA0;
 PORTA = 0;
 TRISA = 0;
 PORTC = 0;
 TRISC = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;
 PWM1_Init(500);
 counter = 0;
 segundos = 0;
 minutos = 0;
 horas = 0;


 while (1) {

 }
}
