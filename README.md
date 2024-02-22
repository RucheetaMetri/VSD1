# A 4-week Research Internship on VSDSquadron Mini RISC-V Dev Board


BOARD SPECIFICATIONS:

| Tech specs   |   |    |
|------------|------------|------------|
| *Board* | Name     | VSDSquadron Mini    |
|      | SKU    | VSDSQM    |
| *Microcontroller*    | CH32V003F4U6 chip with 32-bit RISC-V core based on RV32EC instruction set    |     |
| *USB connector* | USB 2.0 Type-C    |     |
| *Pins*     | Built-in LED Pin     | 1X onboard user led (PD6)     |
|      | Digital I/O pins     | 15     |
|      | Analog I/O pins     | 10-bit ADC, PD0-PD7, PA1, PA2, PC4     |
|      | PWM pins     | 14X     |
|      | External interrupts     | 	8 external interrupt edge detectors, but it only maps one external interrupt to 18 I/O ports     |
| *Communication*     | USART     | 	1x, PD6(RX), PD5(TX)     |
|      | I2C     | 1x, PC1(SDA), PC2(SCL)    |
|      | SPI     | 1x, PC5(SCK), PC1(NSS), PC6(MOSI), PC7(MISO)     |
|      | Programmer/debugger     | Onboard RISC-V programmer/debugger, USB to TTL serial port support     |
| *Power*     | I/O voltage     | 3.3 V    |
|      | Input voltage (nominal)     | 5 V    |
|      | Source Current per I/O Pin    | 8 mA     |
|      | Sink Current per I/O Pin     | 8 mA     |
| *Clock speed*     | Processor    | 24 MHz     |
| *Memory*     | SRAM     | 2kb onchip volatile sram,16kb external program memory     |
   

This repo is intended to document the weekly progress.

### The first online meet was held on 16th of Feb 2024 @6PM

<details>
    <summary> TASK 1 </summary>
 
1) install Yosys 

2) install iverilog 

3) install gtkwave

### CLONING RISC-V GNU TOOLCHAIN

# To install git 
```
sudo apt install git-all
```   

 make sure to install the dependencies
![git all](<WhatsApp Image 2024-02-19 at 4.54.52 PM.jpeg>)



### INSTALLING YOSYS, IVERILOG & GTKWAVE.

### 1.YOSYS

```
git clone https://github.com/YosysHQ/yosys.git
```
![git_clone](<WhatsApp Image 2024-02-19 at 4.54.26 PM.jpeg>)
```
cd yosys 

sudo apt install make

sudo apt-get install build-essential clang bison flex \libreadline-dev gawk tcl-dev libffi-dev git \ graphviz xdot pkg-config python3 libboost-system-dev\libboost-python-dev libboost-filesystem-dev zlib1g-dev

make config-gcc
```
![config](<WhatsApp Image 2024-02-19 at 4.54.26 PM (1).jpeg>)
```
make 

sudo make install
```
![make_install](<WhatsApp Image 2024-02-19 at 4.53.13 PM.jpeg>)


### 2.iVerilog
installing iVerilog
```
sudo apt update

sudo apt-get install iverilog
```
![iVerilog](<WhatsApp Image 2024-02-19 at 4.52.09 PM.jpeg>)

### 3.GTkWave
installing GTkWave
```
 sudo apt-get install gtkwave 
 ```

![gtkwave](<WhatsApp Image 2024-02-19 at 4.51.47 PM.jpeg>)
</details>


### The second online meet was held on 20th of Feb 2024 @6PM
<details>
    <summary> TASK 2 </summary>


## Universal Asynchronous Receiver Transmitter protocol based on hardware transmitter

### Introduction:


In UART communication, two UARTs communicate directly with each other. The transmitting UART converts parallel data from a controlling device like a CPU into serial form, transmits it in serial to the receiving UART, which then converts the serial data back into parallel data for the receiving device. Only two wires are needed to transmit data between two UARTs. Data flows from the Tx pin of the transmitting UART to the Rx pin of the receiving UART:

![Block diagram](<WhatsApp Image 2024-02-21 at 9.34.44 PM.jpeg>)

### Output Waveform of UART

![output waveform](https://github.com/RucheetaMetri/VSD1/assets/160260388/7a7c704b-9627-4a91-aa68-438105f3e1d4)

</details>
