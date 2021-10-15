;
; Thema2_AVR_Assembly.asm
;
; Created: 15/10/2021 14:02:10
; Author : wim.baert
;


/*  OPDRACHT 1

	Een 16 bits teller (delay) in assembleertaal:

	Een 16-bits binaire teller wordt bijgehouden in twee registers. De MSB staat in r17, de LSB in r16
	De teller wordt ingesteld op een bepaalde waarde. Vervolgens zal de teller vanaf die waarde
	naar nul tellen (decrement)
	teruggesprongen naar de start van het programma. 

		1. Maak eerst een schets van de flowchart van dit programma
		2. Schrijf het programma in assembleertaal
		3. Ga na wat de klokfrequentie is die op het Arduinobordje wordt gebruikt. Bepaal (met de stopwatch
		   wat de maximale en minimale tijdsvertraging is die je met deze teller kan realiseren.

	tip: werk met een lus in lus programma waarbij de LSB in de binnenlus aftelt tot 0.
	In de buitenlus telt de MSB ook af tot 0. Wanneer de MSB 0 is dan is de teller uitgeteld. 
*/



/*  OPDRACHT 2

	In opdracht 1 heb je een delay geprogrammeerd. In deze opdracht ga je de code voor de lus in een 
	subroutine plaatsen en aanroepen vanuit een hoofdprogramma.

		4.Schrijf in assembleertaal een programma waarmee je in een oneindige telkens opnieuw de subroutine 
		  voor de geneste lus aanroept. Je noemt de subroutine DELAY

*/


/*  OPDRACHT 3

	In de cursus is beschreven hoe je een digitale ouput kan aansturen (instellen DDR-register en aansturen
	via overeenkomstige PORT-register)
	In opdracht 2 heb je een DELAY-subroutine geprogrammeerd. In deze opdracht ga je die subroutine gebruiken
	om een LED te laten knipperen aan een zekere frequentie. 
	
	1. Zoek op het schema van 	het Arduino-bordje op door welke poort van de µC pinnetje 8 op het arduino-bordje wordt aangestuurd
	2. Configureer het DDR-reguister zodat die desbetreffende aansluiting als output werkt. lees de leerstof in de cursus p.15-16
	3. Schrijf de assemblercode waarmee je de betreffende output toggelt (1-0-1-0). Tussen elke toggle roep je de 
	   in de vorige opdracht geschreven DELAY-routine aan.
	4. Controleer in simulatie of de code werkt. Werk met breakpoints. Bepaal de togglefrequentie. 
	5. Laadt het programma in de µC op het arduino-bordje. Lees eerst de cursus p. 17-20
	6. Sluit aan pinnetje 8 van het arduino-bordje een LED met geschikte voorschakelweerstand aan en ga na of de code werkt
	
	Maak een filmpje terwijl je de code test op het bordje (knipperende LED). Komt de knipperfrequentie overeen met wat je 
	tijdens de simulatie hebt gemeten? Meet de periode na met een oscilloscoop.  
*/


// DEMO CODE...ga eerst na wat deze code doet 

.EQU actueleWaarde = SRAM_START

.org 0x0000
jmp init

;andere code

.org 0x0100
init:
	ldi r16,0x0F

loop:
    dec r16
	sts actueleWaarde, r16
    brne loop
	rjmp init

