unsigned short kp, opcionTemporizador, numeroRepeticiones, i, contNumero, numero;
char textNumero[3];

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

void inicializar(){
    ANSEL = 0;
    ANSELH = 0;
    Keypad_Init();                           // Initialize Keypad
    Lcd_Init();                              // Initialize Lcd
    Lcd_Cmd(_LCD_CLEAR);                      // Clear display
    Lcd_Cmd(_LCD_CURSOR_OFF);                 // Cursor off
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
        case  1:
            numero = numero*10+1;
            textNumero [contNumero]= 49;
            contNumero++;
            //kp = 49;
            break; // 1
        case  2: 
            numero = numero*10+2;
            textNumero [contNumero]= 50;
            contNumero++;
            //kp = 50;
            break; // 2
        case  3: 
            numero = numero*10+3;
            textNumero [contNumero]= 51;
            contNumero++;
            //kp = 51;
            break; // 3
        case  4: 
            //kp = 65; 
            break; // A arriba
        case  5: 
            numero = numero*10+4;
            textNumero [contNumero]= 52;
            contNumero++;
            //kp = 52; 
            break; // 4
        case  6: 
            numero = numero*10+5;
            textNumero [contNumero]= 53;
            contNumero++;
            //kp = 53;
            break; // 5
        case  7: 
            numero = numero*10+1;
            textNumero [contNumero]= 54;
            contNumero++;
            //kp = 54;
            break; // 6
        case  8: 
            //kp = 66; 
            break; // B abajo
        case  9: 
            numero = numero*10+7;
            textNumero [contNumero]= 55;
            contNumero++;
            //kp = 55; 
            break; // 7
        case 10: 
            numero = numero*10+8;
            textNumero [contNumero]= 56;
            contNumero++;
            //kp = 56;
            break; // 8
        case 11: 
            numero = numero*10+9;
            textNumero [contNumero]= 57;
            contNumero++;
            //kp = 57; 
            break; // 9
        case 12: kp = 67; break; // C izq
        case 13: 
             //kp = 42;
             limpiarTextNumero();
             numero = 0;
             contNumero =0;
             break; // * borrar
        case 14: 
            numero = numero*10;
            textNumero [contNumero]= 48;
            contNumero++;
            //kp = 48; 
            break; // 0
        case 15: 
            resultado = 1;
            //kp = 35;
            break; // # enter
        case 16: 
            //kp = 68; 
            break; // D derecha
    }
    return resultado;
}



void main() {
    inicializar();
    opcionTemporizador = 0;//EEPROM_Read(0x00);
    numeroRepeticiones = EEPROM_Read(0x01);
    if  (opcionTemporizador ==0)
    {
        Lcd_Out(1, 1, "******Bienvenido******");
        Lcd_Out(2, 1, "Configure su PetFeeder");
        Delay_ms(250);
        for(i=0; i<6; i++) {               // Move text to the right 4 times
            Lcd_Cmd(_LCD_SHIFT_RIGHT);
            //Lcd_Out(1, 1, "Bienvenido. ");
            Delay_ms(250);
        }
        //Lcd_Out(1, 1, "Bienvenido. ");
        Delay_ms(1250);

        Lcd_Cmd(_LCD_CLEAR);
        Lcd_Out(1, 1, "Num. repeticiones");
        kp=0;
        do{
            if  (contNumero<=3 && numero<256){
                kp = Keypad_Key_Click();
                kp = obtenerValorKeyPad(kp);
                Lcd_Out(2, 1, textNumero);
                /*if (kp){
                    Lcd_Cmd(_LCD_CLEAR);
                    Delay_ms (250);
                    Lcd_Out(1, 1, "Verificando numero");
                    Delay_ms (250);
                    
                    if (numero>255) {
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
                } */
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
        //opcionTemporizador=kp;
        Lcd_Cmd(_LCD_CLEAR);
        Lcd_Out(1, 1, "SALI");

    }
    //else
    //{
    //}
}

