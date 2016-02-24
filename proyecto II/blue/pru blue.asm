
_main:

;pru blue.c,40 :: 		void main() {
;pru blue.c,41 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;pru blue.c,42 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;pru blue.c,43 :: 		cnt = 0;
	CLRF       _cnt+0
;pru blue.c,44 :: 		TRISB=0;
	CLRF       TRISB+0
;pru blue.c,45 :: 		PORTB=0;                              // Reset counter
	CLRF       PORTB+0
;pru blue.c,46 :: 		UART1_Init(19200);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;pru blue.c,47 :: 		Keypad_Init();                           // Initialize Keypad
	CALL       _Keypad_Init+0
;pru blue.c,48 :: 		Lcd_Init();                              // Initialize Lcd
	CALL       _Lcd_Init+0
;pru blue.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);                      // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                 // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,51 :: 		Lcd_Out(1, 4, "John");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,52 :: 		Lcd_Out(2, 3, "Colina");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,53 :: 		delay_ms(4000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;pru blue.c,54 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,55 :: 		Lcd_Out(1, 1, "Key  :");                 // Write message text on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,56 :: 		Lcd_Out(2, 1, "Times:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,58 :: 		do {
L_main1:
;pru blue.c,59 :: 		kp = 0;                                // Reset key code variable
	CLRF       _kp+0
;pru blue.c,62 :: 		do {
L_main4:
;pru blue.c,64 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;pru blue.c,65 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;pru blue.c,66 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;pru blue.c,67 :: 		goto    bluetooth;
	GOTO       ___main_bluetooth
;pru blue.c,68 :: 		}
L_main7:
;pru blue.c,69 :: 		}while (!kp);
	MOVF       _kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;pru blue.c,71 :: 		switch (kp) {
	GOTO       L_main8
;pru blue.c,77 :: 		case  1: kp = 49; break; // 1        // Uncomment this block for keypad4x4
L_main10:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,78 :: 		case  2: kp = 50; break; // 2
L_main11:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,79 :: 		case  3: kp = 51; break; // 3
L_main12:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,80 :: 		case  4: kp = 65; break; // A
L_main13:
	MOVLW      65
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,81 :: 		case  5: kp = 52; break; // 4
L_main14:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,82 :: 		case  6: kp = 53; break; // 5
L_main15:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,83 :: 		case  7: kp = 54; break; // 6
L_main16:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,84 :: 		case  8: kp = 66; break; // B
L_main17:
	MOVLW      66
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,85 :: 		case  9: kp = 55; break; // 7
L_main18:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,86 :: 		case 10: kp = 56; break; // 8
L_main19:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,87 :: 		case 11: kp = 57; break; // 9
L_main20:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,88 :: 		case 12: kp = 67; break; // C
L_main21:
	MOVLW      67
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,89 :: 		case 13: kp = 42; break; // *
L_main22:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,90 :: 		case 14: kp = 48; break; // 0
L_main23:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,91 :: 		case 15: kp = 35; break; // #
L_main24:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,92 :: 		case 16: kp = 68; break; // D
L_main25:
	MOVLW      68
	MOVWF      _kp+0
	GOTO       L_main9
;pru blue.c,94 :: 		}
L_main8:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main25
L_main9:
;pru blue.c,95 :: 		bluetooth: /*dato por bluetooth*/
___main_bluetooth:
;pru blue.c,96 :: 		if (kp != oldstate) {                  // Pressed key differs from previous
	MOVF       _kp+0, 0
	XORWF      _oldstate+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main26
;pru blue.c,97 :: 		cnt = 1;
	MOVLW      1
	MOVWF      _cnt+0
;pru blue.c,98 :: 		oldstate = kp;
	MOVF       _kp+0, 0
	MOVWF      _oldstate+0
;pru blue.c,99 :: 		}
	GOTO       L_main27
L_main26:
;pru blue.c,101 :: 		cnt++;
	INCF       _cnt+0, 1
;pru blue.c,102 :: 		}
L_main27:
;pru blue.c,104 :: 		Lcd_Chr(1, 10, kp);                    // Print key ASCII value on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _kp+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;pru blue.c,106 :: 		if (cnt == 255) {                      // If counter varialble overflow
	MOVF       _cnt+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_main28
;pru blue.c,107 :: 		cnt = 0;
	CLRF       _cnt+0
;pru blue.c,108 :: 		Lcd_Out(2, 10, "   ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,109 :: 		}
L_main28:
;pru blue.c,111 :: 		ByteToStr(cnt, txt);                   // Transform counter value to string
	MOVF       _cnt+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _txt+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;pru blue.c,112 :: 		Lcd_Out(2, 10, txt);                   // Display counter value on Lcd
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,113 :: 		} while (1);
	GOTO       L_main1
;pru blue.c,114 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
