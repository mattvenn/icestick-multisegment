# 10 segment demo

uses 10 segments of a LiteOn LTP537P multi segment display to count 0->9

![seg_wiring](seg_wiring.jpg)

![multi_seg](multiseg.jpg)

# wiring

segments are wired to each pin of the icestick as shown

    44   - -  45
    62  |   | 47
    119  - -  118
    61  |   | 48
    60   - -  56
    
photo shows the common cathode. I connected this to 0v via a 100R resistor and
drove the segments directly from the fpga.

* [LTP537P datasheet](http://datasheet.octopart.com/LTP-537P-Lite-On-datasheet-13712610.pdf)
* [icestick pinout](http://www.pighixxx.net/portfolio-items/icestick/)



# yosys show

* [top](top.png)
* [seg10](seg10.png)

# gtkwave

* [seg10](gtkwave.png)

