
_inicializar:

;petFeeder.c,24 :: 		void inicializar(){
;petFeeder.c,25 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;petFeeder.c,26 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;petFeeder.c,27 :: 		Keypad_Init();                           // Initialize Keypad
	CALL       _Keypad_Init+0
;petFeeder.c,28 :: 		Lcd_Init();                              // Initialize Lcd
	CALL       _Lcd_Init+0
;petFeeder.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);                      // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;petFeeder.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                 // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;petFeeder.c,31 :: 		}
L_end_inicializar:
	RETURN
; end of _inicializar

_guardarRepeticiones:

;petFeeder.c,33 :: 		void guardarRepeticiones (unsigned short _numero)
;petFeeder.c,35 :: 		EEPROM_Write (0x01, _numero);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       FARG_guardarRepeticiones__numero+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;petFeeder.c,36 :: 		}
L_end_guardarRepeticiones:
	RETURN
; end of _guardarRepeticiones

_limpiarTextNumero:

;petFeeder.c,38 :: 		void limpiarTextNumero()
;petFeeder.c,40 :: 		for (i=0; i<3; i++)
	CLRF       _i+0
L_limpiarTextNumero0:
	MOVLW      3
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_limpiarTextNumero1
;petFeeder.c,41 :: 		textNumero[i]=0;
	MOVF       _i+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	CLRF       INDF+0
;petFeeder.c,40 :: 		for (i=0; i<3; i++)
	INCF       _i+0, 1
;petFeeder.c,41 :: 		textNumero[i]=0;
	GOTO       L_limpiarTextNumero0
L_limpiarTextNumero1:
;petFeeder.c,42 :: 		}
L_end_limpiarTextNumero:
	RETURN
; end of _limpiarTextNumero

_obtenerValorKeyPad:

;petFeeder.c,44 :: 		int obtenerValorKeyPad (unsigned short _kp){
;petFeeder.c,45 :: 		int resultado = 0;
	CLRF       obtenerValorKeyPad_resultado_L0+0
	CLRF       obtenerValorKeyPad_resultado_L0+1
;petFeeder.c,46 :: 		switch (_kp) {
	GOTO       L_obtenerValorKeyPad3
;petFeeder.c,47 :: 		case  1:
L_obtenerValorKeyPad5:
;petFeeder.c,48 :: 		numero = numero*10+1;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	INCF       R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,49 :: 		textNumero [contNumero]= 49;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      49
	MOVWF      INDF+0
;petFeeder.c,50 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,52 :: 		break; // 1
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,53 :: 		case  2:
L_obtenerValorKeyPad6:
;petFeeder.c,54 :: 		numero = numero*10+2;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,55 :: 		textNumero [contNumero]= 50;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      50
	MOVWF      INDF+0
;petFeeder.c,56 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,58 :: 		break; // 2
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,59 :: 		case  3:
L_obtenerValorKeyPad7:
;petFeeder.c,60 :: 		numero = numero*10+3;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      3
	ADDWF      R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,61 :: 		textNumero [contNumero]= 51;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      51
	MOVWF      INDF+0
;petFeeder.c,62 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,64 :: 		break; // 3
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,65 :: 		case  4:
L_obtenerValorKeyPad8:
;petFeeder.c,67 :: 		break; // A arriba
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,68 :: 		case  5:
L_obtenerValorKeyPad9:
;petFeeder.c,69 :: 		numero = numero*10+4;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      4
	ADDWF      R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,70 :: 		textNumero [contNumero]= 52;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      52
	MOVWF      INDF+0
;petFeeder.c,71 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,73 :: 		break; // 4
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,74 :: 		case  6:
L_obtenerValorKeyPad10:
;petFeeder.c,75 :: 		numero = numero*10+5;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      5
	ADDWF      R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,76 :: 		textNumero [contNumero]= 53;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      53
	MOVWF      INDF+0
;petFeeder.c,77 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,79 :: 		break; // 5
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,80 :: 		case  7:
L_obtenerValorKeyPad11:
;petFeeder.c,81 :: 		numero = numero*10+1;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	INCF       R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,82 :: 		textNumero [contNumero]= 54;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      54
	MOVWF      INDF+0
;petFeeder.c,83 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,85 :: 		break; // 6
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,86 :: 		case  8:
L_obtenerValorKeyPad12:
;petFeeder.c,88 :: 		break; // B abajo
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,89 :: 		case  9:
L_obtenerValorKeyPad13:
;petFeeder.c,90 :: 		numero = numero*10+7;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      7
	ADDWF      R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,91 :: 		textNumero [contNumero]= 55;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      55
	MOVWF      INDF+0
;petFeeder.c,92 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,94 :: 		break; // 7
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,95 :: 		case 10:
L_obtenerValorKeyPad14:
;petFeeder.c,96 :: 		numero = numero*10+8;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      8
	ADDWF      R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,97 :: 		textNumero [contNumero]= 56;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      56
	MOVWF      INDF+0
;petFeeder.c,98 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,100 :: 		break; // 8
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,101 :: 		case 11:
L_obtenerValorKeyPad15:
;petFeeder.c,102 :: 		numero = numero*10+9;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      9
	ADDWF      R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,103 :: 		textNumero [contNumero]= 57;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      57
	MOVWF      INDF+0
;petFeeder.c,104 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,106 :: 		break; // 9
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,107 :: 		case 12: kp = 67; break; // C izq
L_obtenerValorKeyPad16:
	MOVLW      67
	MOVWF      _kp+0
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,108 :: 		case 13:
L_obtenerValorKeyPad17:
;petFeeder.c,110 :: 		limpiarTextNumero();
	CALL       _limpiarTextNumero+0
;petFeeder.c,111 :: 		numero = 0;
	CLRF       _numero+0
;petFeeder.c,112 :: 		contNumero =0;
	CLRF       _contNumero+0
;petFeeder.c,113 :: 		break; // * borrar
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,114 :: 		case 14:
L_obtenerValorKeyPad18:
;petFeeder.c,115 :: 		numero = numero*10;
	MOVF       _numero+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      _numero+0
;petFeeder.c,116 :: 		textNumero [contNumero]= 48;
	MOVF       _contNumero+0, 0
	ADDLW      _textNumero+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
;petFeeder.c,117 :: 		contNumero++;
	INCF       _contNumero+0, 1
;petFeeder.c,119 :: 		break; // 0
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,120 :: 		case 15:
L_obtenerValorKeyPad19:
;petFeeder.c,121 :: 		resultado = 1;
	MOVLW      1
	MOVWF      obtenerValorKeyPad_resultado_L0+0
	MOVLW      0
	MOVWF      obtenerValorKeyPad_resultado_L0+1
;petFeeder.c,123 :: 		break; // # enter
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,124 :: 		case 16:
L_obtenerValorKeyPad20:
;petFeeder.c,126 :: 		break; // D derecha
	GOTO       L_obtenerValorKeyPad4
;petFeeder.c,127 :: 		}
L_obtenerValorKeyPad3:
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad5
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad6
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad7
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad8
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad9
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad10
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad11
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad12
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad13
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad14
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad15
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad16
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad17
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad18
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad19
	MOVF       FARG_obtenerValorKeyPad__kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerValorKeyPad20
L_obtenerValorKeyPad4:
;petFeeder.c,128 :: 		return resultado;
	MOVF       obtenerValorKeyPad_resultado_L0+0, 0
	MOVWF      R0+0
	MOVF       obtenerValorKeyPad_resultado_L0+1, 0
	MOVWF      R0+1
;petFeeder.c,129 :: 		}
L_end_obtenerValorKeyPad:
	RETURN
; end of _obtenerValorKeyPad

_main:

;petFeeder.c,133 :: 		void main() {
;petFeeder.c,134 :: 		inicializar();
	CALL       _inicializar+0
;petFeeder.c,135 :: 		opcionTemporizador = 0;//EEPROM_Read(0x00);
	CLRF       _opcionTemporizador+0
;petFeeder.c,136 :: 		numeroRepeticiones = EEPROM_Read(0x01);
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _numeroRepeticiones+0
;petFeeder.c,137 :: 		if  (opcionTemporizador ==0)
	MOVF       _opcionTemporizador+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;petFeeder.c,139 :: 		Lcd_Out(1, 1, "******Bienvenido******");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_petFeeder+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;petFeeder.c,140 :: 		Lcd_Out(2, 1, "Configure su PetFeeder");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_petFeeder+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;petFeeder.c,141 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;petFeeder.c,142 :: 		for(i=0; i<6; i++) {               // Move text to the right 4 times
	CLRF       _i+0
L_main23:
	MOVLW      6
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main24
;petFeeder.c,143 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;petFeeder.c,145 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
	NOP
;petFeeder.c,142 :: 		for(i=0; i<6; i++) {               // Move text to the right 4 times
	INCF       _i+0, 1
;petFeeder.c,146 :: 		}
	GOTO       L_main23
L_main24:
;petFeeder.c,148 :: 		Delay_ms(1250);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
;petFeeder.c,150 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;petFeeder.c,151 :: 		Lcd_Out(1, 1, "Num. repeticiones");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_petFeeder+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;petFeeder.c,152 :: 		kp=0;
	CLRF       _kp+0
;petFeeder.c,153 :: 		do{
L_main28:
;petFeeder.c,154 :: 		if  (contNumero<=3 && numero<256){
	MOVF       _contNumero+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main33
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVLW      0
	SUBWF      _numero+0, 0
L__main42:
	BTFSC      STATUS+0, 0
	GOTO       L_main33
L__main36:
;petFeeder.c,155 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;petFeeder.c,156 :: 		kp = obtenerValorKeyPad(kp);
	MOVF       R0+0, 0
	MOVWF      FARG_obtenerValorKeyPad__kp+0
	CALL       _obtenerValorKeyPad+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;petFeeder.c,157 :: 		Lcd_Out(2, 1, textNumero);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _textNumero+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;petFeeder.c,177 :: 		}else{
	GOTO       L_main34
L_main33:
;petFeeder.c,178 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;petFeeder.c,179 :: 		Lcd_Out(1, 1, "Exedio el numero ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_petFeeder+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;petFeeder.c,180 :: 		Lcd_Out(2, 1, "maximo: 255");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_petFeeder+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;petFeeder.c,181 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
;petFeeder.c,182 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;petFeeder.c,183 :: 		Lcd_Out(1, 1, "Num. repeticiones");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_petFeeder+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;petFeeder.c,184 :: 		limpiarTextNumero();
	CALL       _limpiarTextNumero+0
;petFeeder.c,185 :: 		numero = 0;
	CLRF       _numero+0
;petFeeder.c,186 :: 		contNumero =0;
	CLRF       _contNumero+0
;petFeeder.c,187 :: 		kp = 0;
	CLRF       _kp+0
;petFeeder.c,188 :: 		}
L_main34:
;petFeeder.c,190 :: 		}while (!kp);
	MOVF       _kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main28
;petFeeder.c,192 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;petFeeder.c,193 :: 		Lcd_Out(1, 1, "SALI");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_petFeeder+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;petFeeder.c,195 :: 		}
L_main21:
;petFeeder.c,199 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
