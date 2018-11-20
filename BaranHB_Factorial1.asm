LOAD R0,0     ;we should load 0 to use this program again and again.
LOAD R1,5     ;this is the nuber of which asks for factorial
LOAD R3,-1    ;necessary to decrease number to multiply them
LOAD R4,0     ;we add the total number to multply next number 
LOAD R5,1     ;its going to count the number of collected numbers
LOAD R6,0     ;its going to count collected numbers in r6 register
   move r0,r1      ;we need tdis step to control if the client wants 1
   jmpeq r5=r0,    PRINT  ;if the asked number is 1 halt the program
ADDI R2,R1,R3      ;we are going to get a shortage of asking number
   JMP SLOOP              ;firstly go _____step
            BIGLOOP:
      JMPEQ R5=R0, PRINT  ;---> control it if its the last number ,it shoult going to finish
      ADDI R2,R2,R3        ;or substract 1 to mltiply next number
      LOAD R6,0            ;we are going to use r6 again so we need to reset it
      move r1,r4           ;we always get result to r1 
      load r4,0            ;we are going to reset r4 again, we need it to make addition in it
       SLOOP:
        ADDI R4,R4,R1     ;______first start the collecting numbers(multiply a*(a-1))
        ADDI R6,R6,R5     ;its goibgto make multiplation operate in this part
        move r0,r2        ;its necessary to control if its last number
JMPEQ R6=R0,BIGLOOP        ;its going to control,is it operate enough if its enough go ---->
   JMP SLOOP              ;if its not enogh repeat the addition operate
                   PRINT:
LOAD R7,$F0         ;this is necessary to get first four bit
LOAD R8,$0F         ;this is necessary to get last four bit
load rb,00110000B   ; we should add this because after this binary number the characters of number start
LOAD RF,0           ;we should reset rf
AND  R9,R1,R7       ;z:::::its to get first four digit
ROR R9,4            ;x::::we should slide to right to get accurate result
addi r9,r9,rb       ;y:::::we add 00110000 to reach number characters
MOVE RF,R9          ;move to rf to print   
LOAD RF,0           ;we should reset rf
AND  RA,R1,R8       ;z:::::""""
ROR R9,4            ;x::::""""
addi ra,ra,rb       ;y:::::""""
MOVE RF,RA          ;move rf to print

HALT                ;fýnýsh the program



