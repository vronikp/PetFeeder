
_servir:

;servir.c,2 :: 		void servir(unsigned short tamanio) {
;servir.c,4 :: 		PWM1_Start();                       // start PWM1
	CALL       _PWM1_Start+0
;servir.c,5 :: 		PWM1_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.c,6 :: 		Delay_ms(750);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servir0:
	DECFSZ     R13+0, 1
	GOTO       L_servir0
	DECFSZ     R12+0, 1
	GOTO       L_servir0
	DECFSZ     R11+0, 1
	GOTO       L_servir0
	NOP
	NOP
;servir.c,7 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.c,8 :: 		if (tamanio == 'p'){
	MOVF       FARG_servir_tamanio+0, 0
	XORLW      112
	BTFSS      STATUS+0, 2
	GOTO       L_servir1
;servir.c,9 :: 		Delay_ms(500);}
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_servir2:
	DECFSZ     R13+0, 1
	GOTO       L_servir2
	DECFSZ     R12+0, 1
	GOTO       L_servir2
	DECFSZ     R11+0, 1
	GOTO       L_servir2
	NOP
	NOP
	GOTO       L_servir3
L_servir1:
;servir.c,10 :: 		else if (tamanio == 'm'){
	MOVF       FARG_servir_tamanio+0, 0
	XORLW      109
	BTFSS      STATUS+0, 2
	GOTO       L_servir4
;servir.c,11 :: 		Delay_ms(1500);}
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servir5:
	DECFSZ     R13+0, 1
	GOTO       L_servir5
	DECFSZ     R12+0, 1
	GOTO       L_servir5
	DECFSZ     R11+0, 1
	GOTO       L_servir5
	NOP
	NOP
	GOTO       L_servir6
L_servir4:
;servir.c,12 :: 		else if (tamanio == 'g'){
	MOVF       FARG_servir_tamanio+0, 0
	XORLW      103
	BTFSS      STATUS+0, 2
	GOTO       L_servir7
;servir.c,13 :: 		Delay_ms(2000);}
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_servir8:
	DECFSZ     R13+0, 1
	GOTO       L_servir8
	DECFSZ     R12+0, 1
	GOTO       L_servir8
	DECFSZ     R11+0, 1
	GOTO       L_servir8
	NOP
	GOTO       L_servir9
L_servir7:
;servir.c,14 :: 		else if (tamanio == 'x'){
	MOVF       FARG_servir_tamanio+0, 0
	XORLW      120
	BTFSS      STATUS+0, 2
	GOTO       L_servir10
;servir.c,15 :: 		Delay_ms(2500);}
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_servir11:
	DECFSZ     R13+0, 1
	GOTO       L_servir11
	DECFSZ     R12+0, 1
	GOTO       L_servir11
	DECFSZ     R11+0, 1
	GOTO       L_servir11
	NOP
	GOTO       L_servir12
L_servir10:
;servir.c,16 :: 		else {Delay_ms(1500);}
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servir13:
	DECFSZ     R13+0, 1
	GOTO       L_servir13
	DECFSZ     R12+0, 1
	GOTO       L_servir13
	DECFSZ     R11+0, 1
	GOTO       L_servir13
	NOP
	NOP
L_servir12:
L_servir9:
L_servir6:
L_servir3:
;servir.c,18 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;servir.c,19 :: 		PWM1_Set_Duty(30);
	MOVLW      30
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.c,20 :: 		Delay_ms(750);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servir14:
	DECFSZ     R13+0, 1
	GOTO       L_servir14
	DECFSZ     R12+0, 1
	GOTO       L_servir14
	DECFSZ     R11+0, 1
	GOTO       L_servir14
	NOP
	NOP
;servir.c,21 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.c,22 :: 		}
L_end_servir:
	RETURN
; end of _servir

_entdatos:

;servir.c,24 :: 		unsigned short entdatos( unsigned short kp ) {
;servir.c,26 :: 		kp = 0;                                // Reset key code variable
	CLRF       FARG_entdatos_kp+0
;servir.c,29 :: 		do {
L_entdatos15:
;servir.c,31 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      FARG_entdatos_kp+0
;servir.c,32 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos18
;servir.c,33 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      FARG_entdatos_kp+0
;servir.c,34 :: 		goto    bluetooth;
	GOTO       ___entdatos_bluetooth
;servir.c,35 :: 		}
L_entdatos18:
;servir.c,36 :: 		}while (!kp);
	MOVF       FARG_entdatos_kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos15
;servir.c,38 :: 		switch (kp) {
	GOTO       L_entdatos19
;servir.c,44 :: 		case  1: kp = 49; break; // 1        // Uncomment this block for keypad4x4
L_entdatos21:
	MOVLW      49
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,45 :: 		case  2: kp = 50; break; // 2
L_entdatos22:
	MOVLW      50
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,46 :: 		case  3: kp = 51; break; // 3
L_entdatos23:
	MOVLW      51
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,47 :: 		case  4: kp = 65; break; // A
L_entdatos24:
	MOVLW      65
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,48 :: 		case  5: kp = 52; break; // 4
L_entdatos25:
	MOVLW      52
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,49 :: 		case  6: kp = 53; break; // 5
L_entdatos26:
	MOVLW      53
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,50 :: 		case  7: kp = 54; break; // 6
L_entdatos27:
	MOVLW      54
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,51 :: 		case  8: kp = 66; break; // B
L_entdatos28:
	MOVLW      66
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,52 :: 		case  9: kp = 55; break; // 7
L_entdatos29:
	MOVLW      55
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,53 :: 		case 10: kp = 56; break; // 8
L_entdatos30:
	MOVLW      56
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,54 :: 		case 11: kp = 57; break; // 9
L_entdatos31:
	MOVLW      57
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,55 :: 		case 12: kp = 67; break; // C
L_entdatos32:
	MOVLW      67
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,56 :: 		case 13: kp = 42; break; // *
L_entdatos33:
	MOVLW      42
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,57 :: 		case 14: kp = 48; break; // 0
L_entdatos34:
	MOVLW      48
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,58 :: 		case 15: kp = 35; break; // #
L_entdatos35:
	MOVLW      35
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,59 :: 		case 16: kp = 68; break; // D
L_entdatos36:
	MOVLW      68
	MOVWF      FARG_entdatos_kp+0
	GOTO       L_entdatos20
;servir.c,61 :: 		}
L_entdatos19:
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos21
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos22
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos23
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos24
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos25
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos26
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos27
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos28
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos29
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos30
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos31
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos32
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos33
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos34
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos35
	MOVF       FARG_entdatos_kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_entdatos36
L_entdatos20:
;servir.c,62 :: 		bluetooth: /*dato por bluetooth*/
___entdatos_bluetooth:
;servir.c,63 :: 		return kp ;
	MOVF       FARG_entdatos_kp+0, 0
	MOVWF      R0+0
;servir.c,64 :: 		}
L_end_entdatos:
	RETURN
; end of _entdatos
