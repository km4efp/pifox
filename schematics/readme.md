Parts list
---

-----

Transmit switch
---

1k resistor
10k resistor
spst switch

refer to transmitswitch.jpg

Transmission in progress led
---

led
~330ohm resistor (different value ok alters brightness)

refer to transmissionled.jpg

2m lpf
---

1x 5pf capacitor
2x 10pf capacitors
2x 22pf capacitors

20awg magnet/enamel wire
15/64 drill bit
use to create
2x 3 turns coil
1x 2 turns coil

refer to pcblayout.jpg
"x" represents cutting traces

-----

Distributors/Credits
---

-----

Raspberry Pi power switch courtesy of
---

http://mausberry-circuits.myshopify.com/

Note: Requires use of different gpio pins when making connection to pi as of my projects current configuration which only requires an easy change in their configuration file to work around this.  View the setup page on their website.


GPIO breakout pcb board from
---

ebay seller electro-resales

http://m.ebay.com/sch/electro-resales/m.html?isRefine=true&_pgn=2&_nkw=seller%3Aelectro-resales&_sasl=electro-resales

or contact

http://www.electroresales.com/

Note: When using my hand drawn schematic with the electro-resales gpio breakout board the various "x" represent cutting traces from the electro-resales board in between the legs of the coils so the coils can do their job properly.


Lpf design for 2m band
---

followed design from

http://www.homingin.com/boxes.html
