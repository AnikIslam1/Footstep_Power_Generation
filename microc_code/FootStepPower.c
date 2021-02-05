//MD ANIK ISLAM ID_1512132642
//Rishad Arfin(RSF) CSE_331 SECTION_7 Group_8
//Projrct Foot step power generation system using 8051/PIC microcontroller

sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_RS at RB2_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_RS_Direction at TRISB2_bit;

int v;
char a;
char lcd[10];
void main() 
{
  ADCON1 = 0x04;
  Lcd_Init();
  Lcd_Cmd(_LCD_CURSOR_OFF);

  do
  {
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_out(1,1, "READING");
    v = ADC_Read(0);
    
    v = v/10;
    a = v%10;
    lcd[3] = a + '0';

    v = v/10;
    a = v%10;
    lcd[2] = a + '0';

    v = v*0.4887;
    a = v%10;
    lcd[0] = a + '0';

    lcd[1] = '.';

    lcd[4] = ' ';
    lcd[5] = 'V';
    lcd[6] = 'o';
    lcd[7] = 'l';
    lcd[8] = 't';
    lcd[9] = 's';
    Lcd_out(2,7,lcd);
    Delay_ms(100);
  }while(1);
  
}