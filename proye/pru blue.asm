
_qtama:

;servir.c,7 :: 		unsigned short qtama () {
;servir.c,9 :: 		qtama:
___qtama_qtama:
;servir.c,19 :: 		do {
L_qtama0:
;servir.c,20 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,21 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama3
;servir.c,22 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,23 :: 		goto    bluetooth1;
	GOTO       ___qtama_bluetooth1
;servir.c,24 :: 		}
L_qtama3:
;servir.c,25 :: 		}while (!kp);
	MOVF       qtama_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama0
;servir.c,27 :: 		kp = teclado(kp);
	MOVF       qtama_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,28 :: 		bluetooth1:
___qtama_bluetooth1:
;servir.c,30 :: 		if(kp == 'A' ||kp== 'B' ||kp== 'C'||kp== 'D'){
	MOVF       qtama_kp_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L__qtama111
	MOVF       qtama_kp_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L__qtama111
	MOVF       qtama_kp_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L__qtama111
	MOVF       qtama_kp_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L__qtama111
	GOTO       L_qtama6
L__qtama111:
;servir.c,31 :: 		Lcd_chr(2, 5, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       qtama_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,34 :: 		do {
L_qtama7:
;servir.c,35 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,36 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama10
;servir.c,37 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,38 :: 		goto    bluetooth2;
	GOTO       ___qtama_bluetooth2
;servir.c,39 :: 		}
L_qtama10:
;servir.c,40 :: 		}while (!kp);
	MOVF       qtama_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama7
;servir.c,42 :: 		kp = teclado(kp);
	MOVF       qtama_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,43 :: 		bluetooth2:
___qtama_bluetooth2:
;servir.c,45 :: 		if(kp == '#'){
	MOVF       qtama_kp_L0+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_qtama11
;servir.c,46 :: 		goto qtama;
	GOTO       ___qtama_qtama
;servir.c,47 :: 		}
L_qtama11:
;servir.c,48 :: 		}
	GOTO       L_qtama12
L_qtama6:
;servir.c,50 :: 		goto qtama;
	GOTO       ___qtama_qtama
;servir.c,51 :: 		}
L_qtama12:
;servir.c,52 :: 		return (kp);
	MOVF       qtama_kp_L0+0, 0
	MOVWF      R0+0
;servir.c,53 :: 		}
L_end_qtama:
	RETURN
; end of _qtama

_alimentar:

;servir.c,55 :: 		void alimentar(unsigned short tamanio) {
;servir.c,56 :: 		PWM1_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.c,57 :: 		PWM1_Start();                       // start PWM1
	CALL       _PWM1_Start+0
;servir.c,58 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_alimentar13:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar13
	DECFSZ     R12+0, 1
	GOTO       L_alimentar13
	DECFSZ     R11+0, 1
	GOTO       L_alimentar13
	NOP
;servir.c,59 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.c,60 :: 		if (tamanio == 'A'){
	MOVF       FARG_alimentar_tamanio+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_alimentar14
;servir.c,61 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_alimentar15:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar15
	DECFSZ     R12+0, 1
	GOTO       L_alimentar15
	DECFSZ     R11+0, 1
	GOTO       L_alimentar15
	NOP
;servir.c,62 :: 		}
	GOTO       L_alimentar16
L_alimentar14:
;servir.c,63 :: 		else if (tamanio == 'B'){
	MOVF       FARG_alimentar_tamanio+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_alimentar17
;servir.c,64 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_alimentar18:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar18
	DECFSZ     R12+0, 1
	GOTO       L_alimentar18
	DECFSZ     R11+0, 1
	GOTO       L_alimentar18
;servir.c,65 :: 		}
	GOTO       L_alimentar19
L_alimentar17:
;servir.c,66 :: 		else if (tamanio == 'C'){
	MOVF       FARG_alimentar_tamanio+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L_alimentar20
;servir.c,67 :: 		Delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_alimentar21:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar21
	DECFSZ     R12+0, 1
	GOTO       L_alimentar21
	DECFSZ     R11+0, 1
	GOTO       L_alimentar21
	NOP
	NOP
;servir.c,68 :: 		}
	GOTO       L_alimentar22
L_alimentar20:
;servir.c,69 :: 		else if (tamanio == 'D'){
	MOVF       FARG_alimentar_tamanio+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L_alimentar23
;servir.c,70 :: 		Delay_ms(350);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      142
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_alimentar24:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar24
	DECFSZ     R12+0, 1
	GOTO       L_alimentar24
	DECFSZ     R11+0, 1
	GOTO       L_alimentar24
	NOP
;servir.c,71 :: 		}
L_alimentar23:
L_alimentar22:
L_alimentar19:
L_alimentar16:
;servir.c,72 :: 		PWM1_Set_Duty(30);
	MOVLW      30
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.c,73 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;servir.c,74 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_alimentar25:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar25
	DECFSZ     R12+0, 1
	GOTO       L_alimentar25
	DECFSZ     R11+0, 1
	GOTO       L_alimentar25
	NOP
;servir.c,75 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.c,76 :: 		}
L_end_alimentar:
	RETURN
; end of _alimentar

_ccalimentah:

;servir.c,78 :: 		unsigned short ccalimentah () {
;servir.c,81 :: 		ccalimentah:
___ccalimentah_ccalimentah:
;servir.c,82 :: 		dig = 0;
	CLRF       ccalimentah_dig_L0+0
;servir.c,83 :: 		nonumh:
___ccalimentah_nonumh:
;servir.c,86 :: 		do {
L_ccalimentah26:
;servir.c,87 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      ccalimentah_kp_L0+0
;servir.c,88 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ccalimentah29
;servir.c,89 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      ccalimentah_kp_L0+0
;servir.c,90 :: 		goto    bluetooth4;
	GOTO       ___ccalimentah_bluetooth4
;servir.c,91 :: 		}
L_ccalimentah29:
;servir.c,92 :: 		}while (!kp);
	MOVF       ccalimentah_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ccalimentah26
;servir.c,94 :: 		kp = teclado(kp);
	MOVF       ccalimentah_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      ccalimentah_kp_L0+0
;servir.c,95 :: 		bluetooth4:
___ccalimentah_bluetooth4:
;servir.c,96 :: 		Lcd_chr(2, 7,kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentah_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,97 :: 		delay();
	CALL       _delay+0
;servir.c,99 :: 		nnumh:
___ccalimentah_nnumh:
;servir.c,100 :: 		if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'||kp == '#' ||kp == '*'){
	MOVF       ccalimentah_kp_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentah115
	MOVF       ccalimentah_kp_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentah115
	MOVF       ccalimentah_kp_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentah115
	MOVF       ccalimentah_kp_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentah115
	MOVF       ccalimentah_kp_L0+0, 0
	XORLW      35
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentah115
	MOVF       ccalimentah_kp_L0+0, 0
	XORLW      42
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentah115
	GOTO       L_ccalimentah32
L__ccalimentah115:
;servir.c,102 :: 		Lcd_chr(1, 1,'n');  Lcd_chr(1, 2,'o'); Lcd_chr(1, 4,'n'); Lcd_chr(1, 5,'u'); Lcd_chr(1, 6,'m');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      110
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      111
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      110
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      117
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      109
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,103 :: 		delay();
	CALL       _delay+0
;servir.c,104 :: 		goto nonumh;
	GOTO       ___ccalimentah_nonumh
;servir.c,105 :: 		}
L_ccalimentah32:
;servir.c,107 :: 		dig++;
	INCF       ccalimentah_dig_L0+0, 1
;servir.c,109 :: 		if(dig == 1 && (kp-48) <= 2 ){
	MOVF       ccalimentah_dig_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_ccalimentah36
	MOVLW      48
	SUBWF      ccalimentah_kp_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ccalimentah123
	MOVF       R1+0, 0
	SUBLW      2
L__ccalimentah123:
	BTFSS      STATUS+0, 0
	GOTO       L_ccalimentah36
L__ccalimentah114:
;servir.c,110 :: 		hora = kp-48;
	MOVLW      48
	SUBWF      ccalimentah_kp_L0+0, 0
	MOVWF      ccalimentah_hora_L0+0
;servir.c,111 :: 		Lcd_Chr(2, 7, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentah_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,114 :: 		do {
L_ccalimentah37:
;servir.c,115 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      ccalimentah_kp_L0+0
;servir.c,116 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ccalimentah40
;servir.c,117 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      ccalimentah_kp_L0+0
;servir.c,118 :: 		goto    bluetooth;
	GOTO       ___ccalimentah_bluetooth
;servir.c,119 :: 		}
L_ccalimentah40:
;servir.c,120 :: 		}while (!kp);
	MOVF       ccalimentah_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ccalimentah37
;servir.c,122 :: 		kp = teclado(kp);
	MOVF       ccalimentah_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      ccalimentah_kp_L0+0
;servir.c,123 :: 		bluetooth:
___ccalimentah_bluetooth:
;servir.c,124 :: 		Lcd_Chr(2, 7, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentah_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,125 :: 		delay();
	CALL       _delay+0
;servir.c,127 :: 		if(kp == '#'){
	MOVF       ccalimentah_kp_L0+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_ccalimentah41
;servir.c,128 :: 		goto ccalimentah;
	GOTO       ___ccalimentah_ccalimentah
;servir.c,129 :: 		}
L_ccalimentah41:
;servir.c,130 :: 		else if (kp == '*'){
	MOVF       ccalimentah_kp_L0+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_ccalimentah43
;servir.c,131 :: 		Lcd_Chr(2, 7, (hora+48));
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      ccalimentah_hora_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,132 :: 		delay();
	CALL       _delay+0
;servir.c,133 :: 		}
	GOTO       L_ccalimentah44
L_ccalimentah43:
;servir.c,135 :: 		goto nnumh;
	GOTO       ___ccalimentah_nnumh
;servir.c,136 :: 		}
L_ccalimentah44:
;servir.c,137 :: 		}
	GOTO       L_ccalimentah45
L_ccalimentah36:
;servir.c,138 :: 		else if (dig == 2 && (kp-48) <= 4){
	MOVF       ccalimentah_dig_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_ccalimentah48
	MOVLW      48
	SUBWF      ccalimentah_kp_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ccalimentah124
	MOVF       R1+0, 0
	SUBLW      4
L__ccalimentah124:
	BTFSS      STATUS+0, 0
	GOTO       L_ccalimentah48
L__ccalimentah113:
;servir.c,139 :: 		Lcd_chr(2, 7, (hora+48));
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      ccalimentah_hora_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,140 :: 		hora = (kp-48)+(10*hora);
	MOVLW      48
	SUBWF      ccalimentah_kp_L0+0, 0
	MOVWF      FLOC__ccalimentah+0
	MOVLW      10
	MOVWF      R0+0
	MOVF       ccalimentah_hora_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	ADDWF      FLOC__ccalimentah+0, 0
	MOVWF      ccalimentah_hora_L0+0
;servir.c,141 :: 		Lcd_chr(2, 8, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentah_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,142 :: 		Lcd_chr(2, 10, hora);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentah_hora_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,143 :: 		delay();
	CALL       _delay+0
;servir.c,144 :: 		}
	GOTO       L_ccalimentah49
L_ccalimentah48:
;servir.c,145 :: 		else if (dig == 2 && (kp-48) >= 5){
	MOVF       ccalimentah_dig_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_ccalimentah52
	MOVLW      48
	SUBWF      ccalimentah_kp_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ccalimentah125
	MOVLW      5
	SUBWF      R1+0, 0
L__ccalimentah125:
	BTFSS      STATUS+0, 0
	GOTO       L_ccalimentah52
L__ccalimentah112:
;servir.c,146 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;servir.c,147 :: 		Lcd_chr(1, 1,'m');  Lcd_chr(1, 2,'a'); Lcd_chr(1, 3,'x'); Lcd_chr(1, 5,'t');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      109
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      97
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      120
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      116
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,148 :: 		delay();
	CALL       _delay+0
;servir.c,149 :: 		goto ccalimentah;
	GOTO       ___ccalimentah_ccalimentah
;servir.c,150 :: 		}
L_ccalimentah52:
;servir.c,152 :: 		hora = kp-48;
	MOVLW      48
	SUBWF      ccalimentah_kp_L0+0, 0
	MOVWF      ccalimentah_hora_L0+0
;servir.c,153 :: 		Lcd_Chr(2, 7, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentah_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,154 :: 		delay();
	CALL       _delay+0
;servir.c,155 :: 		}
L_ccalimentah49:
L_ccalimentah45:
;servir.c,156 :: 		return (hora);
	MOVF       ccalimentah_hora_L0+0, 0
	MOVWF      R0+0
;servir.c,157 :: 		}
L_end_ccalimentah:
	RETURN
; end of _ccalimentah

_ccalimentam:

;servir.c,159 :: 		unsigned short ccalimentam () {
;servir.c,162 :: 		ccalimentaM:
___ccalimentam_ccalimentaM:
;servir.c,163 :: 		dig = 0;
	CLRF       ccalimentam_dig_L0+0
;servir.c,164 :: 		nonumm:
___ccalimentam_nonumm:
;servir.c,167 :: 		do {
L_ccalimentam54:
;servir.c,168 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      ccalimentam_kp_L0+0
;servir.c,169 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ccalimentam57
;servir.c,170 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      ccalimentam_kp_L0+0
;servir.c,171 :: 		goto    bluetoothm1;
	GOTO       ___ccalimentam_bluetoothm1
;servir.c,172 :: 		}
L_ccalimentam57:
;servir.c,173 :: 		}while (!kp);
	MOVF       ccalimentam_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ccalimentam54
;servir.c,174 :: 		kp = teclado(kp);
	MOVF       ccalimentam_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      ccalimentam_kp_L0+0
;servir.c,175 :: 		bluetoothm1:
___ccalimentam_bluetoothm1:
;servir.c,176 :: 		Lcd_chr(2, 7,kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentam_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,177 :: 		delay();
	CALL       _delay+0
;servir.c,179 :: 		nnumm:
___ccalimentam_nnumm:
;servir.c,180 :: 		if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'||kp == '#' ||kp == '*'){
	MOVF       ccalimentam_kp_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentam118
	MOVF       ccalimentam_kp_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentam118
	MOVF       ccalimentam_kp_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentam118
	MOVF       ccalimentam_kp_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentam118
	MOVF       ccalimentam_kp_L0+0, 0
	XORLW      35
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentam118
	MOVF       ccalimentam_kp_L0+0, 0
	XORLW      42
	BTFSC      STATUS+0, 2
	GOTO       L__ccalimentam118
	GOTO       L_ccalimentam60
L__ccalimentam118:
;servir.c,181 :: 		Lcd_chr(1,1,'n'); Lcd_chr(1,2,'o'); Lcd_chr(1,3,'n'); Lcd_chr(1,4,'u'); Lcd_chr(1,5,'m');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      110
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      111
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      110
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      117
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      109
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,182 :: 		delay();
	CALL       _delay+0
;servir.c,183 :: 		goto nonumm;
	GOTO       ___ccalimentam_nonumm
;servir.c,184 :: 		}
L_ccalimentam60:
;servir.c,186 :: 		dig++;
	INCF       ccalimentam_dig_L0+0, 1
;servir.c,189 :: 		if(dig == 1 && (kp-48) <= 5 && (kp-48) >= 0){
	MOVF       ccalimentam_dig_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_ccalimentam64
	MOVLW      48
	SUBWF      ccalimentam_kp_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ccalimentam127
	MOVF       R1+0, 0
	SUBLW      5
L__ccalimentam127:
	BTFSS      STATUS+0, 0
	GOTO       L_ccalimentam64
	MOVLW      48
	SUBWF      ccalimentam_kp_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ccalimentam128
	MOVLW      0
	SUBWF      R1+0, 0
L__ccalimentam128:
	BTFSS      STATUS+0, 0
	GOTO       L_ccalimentam64
L__ccalimentam117:
;servir.c,190 :: 		minuto = kp-48;
	MOVLW      48
	SUBWF      ccalimentam_kp_L0+0, 0
	MOVWF      ccalimentam_minuto_L0+0
;servir.c,191 :: 		Lcd_Chr(2, 7, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentam_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,194 :: 		do {
L_ccalimentam65:
;servir.c,195 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      ccalimentam_kp_L0+0
;servir.c,196 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ccalimentam68
;servir.c,197 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      ccalimentam_kp_L0+0
;servir.c,198 :: 		goto    bluetoothm2;
	GOTO       ___ccalimentam_bluetoothm2
;servir.c,199 :: 		}
L_ccalimentam68:
;servir.c,200 :: 		}while (!kp);
	MOVF       ccalimentam_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ccalimentam65
;servir.c,201 :: 		kp = teclado(kp);
	MOVF       ccalimentam_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      ccalimentam_kp_L0+0
;servir.c,202 :: 		bluetoothm2:
___ccalimentam_bluetoothm2:
;servir.c,203 :: 		Lcd_Chr(2, 7, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentam_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,204 :: 		delay();
	CALL       _delay+0
;servir.c,206 :: 		if(kp == '#'){
	MOVF       ccalimentam_kp_L0+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_ccalimentam69
;servir.c,207 :: 		goto ccalimentam;
	GOTO       ___ccalimentam_ccalimentaM
;servir.c,208 :: 		}
L_ccalimentam69:
;servir.c,209 :: 		else if (kp == '*'){
	MOVF       ccalimentam_kp_L0+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_ccalimentam71
;servir.c,210 :: 		Lcd_Chr(2, 7, (minuto+48));
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      ccalimentam_minuto_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,211 :: 		delay();
	CALL       _delay+0
;servir.c,212 :: 		}
	GOTO       L_ccalimentam72
L_ccalimentam71:
;servir.c,214 :: 		goto nnumm;
	GOTO       ___ccalimentam_nnumm
;servir.c,215 :: 		}
L_ccalimentam72:
;servir.c,216 :: 		}
	GOTO       L_ccalimentam73
L_ccalimentam64:
;servir.c,217 :: 		else if (dig == 2 && (kp-48) <= 9 && (kp-48) >= 0){
	MOVF       ccalimentam_dig_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_ccalimentam76
	MOVLW      48
	SUBWF      ccalimentam_kp_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ccalimentam129
	MOVF       R1+0, 0
	SUBLW      9
L__ccalimentam129:
	BTFSS      STATUS+0, 0
	GOTO       L_ccalimentam76
	MOVLW      48
	SUBWF      ccalimentam_kp_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ccalimentam130
	MOVLW      0
	SUBWF      R1+0, 0
L__ccalimentam130:
	BTFSS      STATUS+0, 0
	GOTO       L_ccalimentam76
L__ccalimentam116:
;servir.c,218 :: 		Lcd_chr(2,7,(minuto+48));
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      ccalimentam_minuto_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,219 :: 		minuto = (kp-48)+(10*minuto);
	MOVLW      48
	SUBWF      ccalimentam_kp_L0+0, 0
	MOVWF      FLOC__ccalimentam+0
	MOVLW      10
	MOVWF      R0+0
	MOVF       ccalimentam_minuto_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	ADDWF      FLOC__ccalimentam+0, 0
	MOVWF      ccalimentam_minuto_L0+0
;servir.c,220 :: 		Lcd_chr(2,8,kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentam_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,221 :: 		Lcd_chr(2,10,minuto);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentam_minuto_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,222 :: 		delay();
	CALL       _delay+0
;servir.c,223 :: 		}
	GOTO       L_ccalimentam77
L_ccalimentam76:
;servir.c,225 :: 		minuto = kp-48;
	MOVLW      48
	SUBWF      ccalimentam_kp_L0+0, 0
	MOVWF      ccalimentam_minuto_L0+0
;servir.c,226 :: 		Lcd_Chr(2, 7, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       ccalimentam_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,227 :: 		delay();
	CALL       _delay+0
;servir.c,228 :: 		}
L_ccalimentam77:
L_ccalimentam73:
;servir.c,229 :: 		return(minuto);
	MOVF       ccalimentam_minuto_L0+0, 0
	MOVWF      R0+0
;servir.c,230 :: 		}
L_end_ccalimentam:
	RETURN
; end of _ccalimentam

_teclado:

;servir.c,232 :: 		unsigned short teclado (unsigned short kp) {
;servir.c,233 :: 		switch (kp) {
	GOTO       L_teclado78
;servir.c,234 :: 		case  1: return 49; break; // 1
L_teclado80:
	MOVLW      49
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,235 :: 		case  2: return 50; break; // 2
L_teclado81:
	MOVLW      50
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,236 :: 		case  3: return 51; break; // 3
L_teclado82:
	MOVLW      51
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,237 :: 		case  4: return 65; break; // A
L_teclado83:
	MOVLW      65
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,238 :: 		case  5: return 52; break; // 4
L_teclado84:
	MOVLW      52
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,239 :: 		case  6: return 53; break; // 5
L_teclado85:
	MOVLW      53
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,240 :: 		case  7: return 54; break; // 6
L_teclado86:
	MOVLW      54
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,241 :: 		case  8: return 66; break; // B
L_teclado87:
	MOVLW      66
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,242 :: 		case  9: return 55; break; // 7
L_teclado88:
	MOVLW      55
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,243 :: 		case 10: return 56; break; // 8
L_teclado89:
	MOVLW      56
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,244 :: 		case 11: return 57; break; // 9
L_teclado90:
	MOVLW      57
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,245 :: 		case 12: return 67; break; // C
L_teclado91:
	MOVLW      67
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,246 :: 		case 13: return 42; break; // *
L_teclado92:
	MOVLW      42
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,247 :: 		case 14: return 48; break; // 0
L_teclado93:
	MOVLW      48
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,248 :: 		case 15: return 35; break; // #
L_teclado94:
	MOVLW      35
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,249 :: 		case 16: return 68; break; // D
L_teclado95:
	MOVLW      68
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,250 :: 		}
L_teclado78:
	MOVF       FARG_teclado_kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_teclado80
	MOVF       FARG_teclado_kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_teclado81
	MOVF       FARG_teclado_kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_teclado82
	MOVF       FARG_teclado_kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_teclado83
	MOVF       FARG_teclado_kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_teclado84
	MOVF       FARG_teclado_kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_teclado85
	MOVF       FARG_teclado_kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_teclado86
	MOVF       FARG_teclado_kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_teclado87
	MOVF       FARG_teclado_kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_teclado88
	MOVF       FARG_teclado_kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_teclado89
	MOVF       FARG_teclado_kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_teclado90
	MOVF       FARG_teclado_kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_teclado91
	MOVF       FARG_teclado_kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_teclado92
	MOVF       FARG_teclado_kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_teclado93
	MOVF       FARG_teclado_kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_teclado94
	MOVF       FARG_teclado_kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_teclado95
;servir.c,251 :: 		}
L_end_teclado:
	RETURN
; end of _teclado

_delay:

;servir.c,253 :: 		void delay(){
;servir.c,254 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_delay96:
	DECFSZ     R13+0, 1
	GOTO       L_delay96
	DECFSZ     R12+0, 1
	GOTO       L_delay96
	DECFSZ     R11+0, 1
	GOTO       L_delay96
	NOP
	NOP
;servir.c,255 :: 		}
L_end_delay:
	RETURN
; end of _delay

_main:

;pru blue.c,31 :: 		void main() {
;pru blue.c,38 :: 		OPTION_REG = 0x83;             // Set timer TMR0
	MOVLW      131
	MOVWF      OPTION_REG+0
;pru blue.c,39 :: 		TMR0 = 131;
	MOVLW      131
	MOVWF      TMR0+0
;pru blue.c,40 :: 		INTCON = 0xA0;                 // Disable interrupt PEIE,INTE,RBIE,T0IE
	MOVLW      160
	MOVWF      INTCON+0
;pru blue.c,41 :: 		PORTA = 0;                     // Turn off both displays
	CLRF       PORTA+0
;pru blue.c,42 :: 		TRISA = 0;                     // All port A pins are configured as outputs
	CLRF       TRISA+0
;pru blue.c,43 :: 		PORTb = 0;                     // Turn off both displays
	CLRF       PORTB+0
;pru blue.c,44 :: 		TRISb = 0;
	CLRF       TRISB+0
;pru blue.c,45 :: 		C1ON_bit = 0;                       // Disable comparators
	BCF        C1ON_bit+0, 7
;pru blue.c,46 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, 7
;pru blue.c,47 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pru blue.c,48 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;pru blue.c,49 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;pru blue.c,50 :: 		UART1_Init(19200);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;pru blue.c,51 :: 		Keypad_Init();                           // Initialize Keypad
	CALL       _Keypad_Init+0
;pru blue.c,52 :: 		Lcd_Init();                              // Initialize Lcd
	CALL       _Lcd_Init+0
;pru blue.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);                      // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,54 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                 // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,55 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;pru blue.c,56 :: 		segundos = 0;
	CLRF       _segundos+0
;pru blue.c,57 :: 		minutos = 0;
	CLRF       _minutos+0
;pru blue.c,58 :: 		horas = 0;
	CLRF       _horas+0
;pru blue.c,59 :: 		kp = 0;
	CLRF       _kp+0
;pru blue.c,63 :: 		do{
L_main97:
;pru blue.c,64 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,65 :: 		Lcd_Out(1, 1, "Hola ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,66 :: 		Lcd_Out(2, 1, "Pres una tecla");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,67 :: 		do {
L_main100:
;pru blue.c,68 :: 		kp =Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;pru blue.c,69 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main103
;pru blue.c,70 :: 		kp = 1;
	MOVLW      1
	MOVWF      _kp+0
;pru blue.c,71 :: 		}
L_main103:
;pru blue.c,72 :: 		}while (!kp);
	MOVF       _kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main100
;pru blue.c,74 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,75 :: 		Lcd_Out(1, 1, "Elija tamaño");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,76 :: 		delay();
	CALL       _delay+0
;pru blue.c,77 :: 		tama = qtama ();
	CALL       _qtama+0
	MOVF       R0+0, 0
	MOVWF      _tama+0
;pru blue.c,79 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,80 :: 		Lcd_Out(1, 1, "Cada cuanto");                 // Write message text on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,81 :: 		Lcd_Out(2, 1, "alimentar mascot");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,82 :: 		delay();
	CALL       _delay+0
;pru blue.c,83 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,84 :: 		Lcd_Out(1, 1, "Numero de horas");                 // Write message text on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,85 :: 		hora = ccalimentah ();
	CALL       _ccalimentah+0
	MOVF       R0+0, 0
	MOVWF      _hora+0
;pru blue.c,86 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,87 :: 		Lcd_Out(1, 1, " # de minutos");                 // Write message text on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,88 :: 		minuto = ccalimentam ();
	CALL       _ccalimentam+0
	MOVF       R0+0, 0
	MOVWF      _minuto+0
;pru blue.c,89 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,90 :: 		Lcd_Out(1, 1, "# de segundos");                 // Write message text on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,91 :: 		seg = ccalimentam ();
	CALL       _ccalimentam+0
	MOVF       R0+0, 0
	MOVWF      _seg+0
;pru blue.c,93 :: 		EEPROM_Write(0x01,tama);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _tama+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;pru blue.c,94 :: 		EEPROM_Write(0x02,hora);
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _hora+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;pru blue.c,95 :: 		EEPROM_Write(0x03,minuto);
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _minuto+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;pru blue.c,96 :: 		EEPROM_Write(0x04,seg);
	MOVLW      4
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _seg+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;pru blue.c,97 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;pru blue.c,98 :: 		segundos = 0;
	CLRF       _segundos+0
;pru blue.c,99 :: 		minutos = 0;
	CLRF       _minutos+0
;pru blue.c,100 :: 		horas = 0;
	CLRF       _horas+0
;pru blue.c,101 :: 		}while (1);
	GOTO       L_main97
;pru blue.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;pru blue.c,104 :: 		void interrupt() {
;pru blue.c,105 :: 		if (INTCON.TMR0IF) {
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt104
;pru blue.c,106 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;pru blue.c,107 :: 		if (counter == 1000) {
	MOVF       _counter+1, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt136
	MOVLW      232
	XORWF      _counter+0, 0
L__interrupt136:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt105
;pru blue.c,108 :: 		counter =0;
	CLRF       _counter+0
	CLRF       _counter+1
;pru blue.c,109 :: 		segundos++;
	INCF       _segundos+0, 1
;pru blue.c,110 :: 		portb++;
	INCF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;pru blue.c,111 :: 		if (segundos == 60) {
	MOVF       _segundos+0, 0
	XORLW      60
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt106
;pru blue.c,112 :: 		segundos = 0;
	CLRF       _segundos+0
;pru blue.c,113 :: 		minutos++;
	INCF       _minutos+0, 1
;pru blue.c,114 :: 		if (minutos == 60) {
	MOVF       _minutos+0, 0
	XORLW      60
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt107
;pru blue.c,115 :: 		minutos = 0;
	CLRF       _minutos+0
;pru blue.c,116 :: 		horas++;
	INCF       _horas+0, 1
;pru blue.c,117 :: 		}
L_interrupt107:
;pru blue.c,118 :: 		}
L_interrupt106:
;pru blue.c,119 :: 		}
L_interrupt105:
;pru blue.c,120 :: 		if (segundos==seg && minutos==minuto && horas==hora) {
	MOVF       _segundos+0, 0
	XORWF      _seg+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt110
	MOVF       _minutos+0, 0
	XORWF      _minuto+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt110
	MOVF       _horas+0, 0
	XORWF      _hora+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt110
L__interrupt119:
;pru blue.c,121 :: 		alimentar(tama);
	MOVF       _tama+0, 0
	MOVWF      FARG_alimentar_tamanio+0
	CALL       _alimentar+0
;pru blue.c,122 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;pru blue.c,123 :: 		segundos = 0;
	CLRF       _segundos+0
;pru blue.c,124 :: 		minutos = 0;
	CLRF       _minutos+0
;pru blue.c,125 :: 		horas = 0;
	CLRF       _horas+0
;pru blue.c,126 :: 		}
L_interrupt110:
;pru blue.c,127 :: 		}
L_interrupt104:
;pru blue.c,128 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;pru blue.c,129 :: 		TMR0 = 130;
	MOVLW      130
	MOVWF      TMR0+0
;pru blue.c,130 :: 		}
L_end_interrupt:
L__interrupt135:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
