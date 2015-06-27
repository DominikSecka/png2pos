# png2pos — Supported Printers

png2pos conforms to ESC/POS language used mainly by these printers:

model | status | notes
:----- | :------ | :-----
Epson TM-T70 | tested | 
Epson TM-T20 | tested | 
Epson TM-T20II | tested | PRINTER_MAX_WIDTH=576
Epson TM-T88III/IV | tested | 
Epson TM-T90 |  | 
Epson TM-L90 |  | 
Epson TM-P60 |  | 
Epson TM-J2000/J2100 |  | GS8L_MAX_Y=128
PRT PT562A-B | tested |
PRT PT802A-B | tested |

PRINTER_MAX_WIDTH and GS8L_MAX_Y values could be changed during compilation
or via ```PNG2POS_PRINTER_MAX_WIDTH``` and ```PNG2POS_GS8L_MAX_Y``` shell variables.
Please see man page for further details.
