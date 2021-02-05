
_main:

;FootStepPower.c,21 :: 		void main()
;FootStepPower.c,23 :: 		ADCON1 = 0x04;
	MOVLW      4
	MOVWF      ADCON1+0
;FootStepPower.c,24 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;FootStepPower.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;FootStepPower.c,27 :: 		do
L_main0:
;FootStepPower.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;FootStepPower.c,30 :: 		Lcd_out(1,1, "READING");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_FootStepPower+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;FootStepPower.c,31 :: 		v = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _v+0
	MOVF       R0+1, 0
	MOVWF      _v+1
;FootStepPower.c,33 :: 		v = v/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _v+0
	MOVF       FLOC__main+1, 0
	MOVWF      _v+1
;FootStepPower.c,34 :: 		a = v%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _a+0
;FootStepPower.c,35 :: 		lcd[3] = a + '0';
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _lcd+3
;FootStepPower.c,38 :: 		v = v/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _v+0
	MOVF       FLOC__main+1, 0
	MOVWF      _v+1
;FootStepPower.c,39 :: 		a = v%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _a+0
;FootStepPower.c,40 :: 		lcd[2] = a + '0';
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _lcd+2
;FootStepPower.c,42 :: 		v = v*0.4887;
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVLW      227
	MOVWF      R4+0
	MOVLW      54
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _v+0
	MOVF       R0+1, 0
	MOVWF      _v+1
;FootStepPower.c,43 :: 		a = v%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _a+0
;FootStepPower.c,44 :: 		lcd[0] = a + '0';
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _lcd+0
;FootStepPower.c,46 :: 		lcd[1] = '.';
	MOVLW      46
	MOVWF      _lcd+1
;FootStepPower.c,48 :: 		lcd[4] = ' ';
	MOVLW      32
	MOVWF      _lcd+4
;FootStepPower.c,49 :: 		lcd[5] = 'V';
	MOVLW      86
	MOVWF      _lcd+5
;FootStepPower.c,50 :: 		lcd[6] = 'o';
	MOVLW      111
	MOVWF      _lcd+6
;FootStepPower.c,51 :: 		lcd[7] = 'l';
	MOVLW      108
	MOVWF      _lcd+7
;FootStepPower.c,52 :: 		lcd[8] = 't';
	MOVLW      116
	MOVWF      _lcd+8
;FootStepPower.c,53 :: 		lcd[9] = 's';
	MOVLW      115
	MOVWF      _lcd+9
;FootStepPower.c,54 :: 		Lcd_out(2,7,lcd);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _lcd+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;FootStepPower.c,55 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;FootStepPower.c,56 :: 		}while(1);
	GOTO       L_main0
;FootStepPower.c,57 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
