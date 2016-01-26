#line 1 "C:/Users/PC/Documents/GitHub/PetFeeder/petFeeder.c"
unsigned short kp, opcionTemporizador, numeroRepeticiones, i, contNumero, numero;
char textNumero[3];


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


void inicializar(){
 ANSEL = 0;
 ANSELH = 0;
 Keypad_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
}

void guardarRepeticiones (unsigned short _numero)
{
 EEPROM_Write (0x01, _numero);
}

void limpiarTextNumero()
{
 for (i=0; i<3; i++)
 textNumero[i]=0;
}

int obtenerValorKeyPad (unsigned short _kp){
 int resultado = 0;
 switch (_kp) {
 case 1:
 numero = numero*10+1;
 textNumero [contNumero]= 49;
 contNumero++;

 break;
 case 2:
 numero = numero*10+2;
 textNumero [contNumero]= 50;
 contNumero++;

 break;
 case 3:
 numero = numero*10+3;
 textNumero [contNumero]= 51;
 contNumero++;

 break;
 case 4:

 break;
 case 5:
 numero = numero*10+4;
 textNumero [contNumero]= 52;
 contNumero++;

 break;
 case 6:
 numero = numero*10+5;
 textNumero [contNumero]= 53;
 contNumero++;

 break;
 case 7:
 numero = numero*10+1;
 textNumero [contNumero]= 54;
 contNumero++;

 break;
 case 8:

 break;
 case 9:
 numero = numero*10+7;
 textNumero [contNumero]= 55;
 contNumero++;

 break;
 case 10:
 numero = numero*10+8;
 textNumero [contNumero]= 56;
 contNumero++;

 break;
 case 11:
 numero = numero*10+9;
 textNumero [contNumero]= 57;
 contNumero++;

 break;
 case 12: kp = 67; break;
 case 13:

 limpiarTextNumero();
 numero = 0;
 contNumero =0;
 break;
 case 14:
 numero = numero*10;
 textNumero [contNumero]= 48;
 contNumero++;

 break;
 case 15:
 resultado = 1;

 break;
 case 16:

 break;
 }
 return resultado;
}



void main() {
 inicializar();
 opcionTemporizador = 0;
 numeroRepeticiones = EEPROM_Read(0x01);
 if (opcionTemporizador ==0)
 {
 Lcd_Out(1, 1, "******Bienvenido******");
 Lcd_Out(2, 1, "Configure su PetFeeder");
 Delay_ms(250);
 for(i=0; i<6; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);

 Delay_ms(250);
 }

 Delay_ms(1250);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Num. repeticiones");
 kp=0;
 do{
 if (contNumero<=3 && numero<256){
 kp = Keypad_Key_Click();
 kp = obtenerValorKeyPad(kp);
 Lcd_Out(2, 1, textNumero);
#line 177 "C:/Users/PC/Documents/GitHub/PetFeeder/petFeeder.c"
 }else{
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Exedio el numero ");
 Lcd_Out(2, 1, "maximo: 255");
 Delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Num. repeticiones");
 limpiarTextNumero();
 numero = 0;
 contNumero =0;
 kp = 0;
 }

 }while (!kp);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "SALI");

 }



}
