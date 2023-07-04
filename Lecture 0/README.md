# __Introduction to VHDL__

![Starry Night Logic](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/starrynightlogic.jpeg)

---

__Mohamed Salem Mohamed__

Drive: https://drive.google.com/drive/folders/19KyYJOgZSFlZfGzc6FWgkRxtoCVd9kQp?usp=sharing

---
### Lecture 0
---

VHDL, which stands for VHSIC Hardware Description Language which also is an acronym for Very High-Speed Integrated Circuit Hardware Description Language, is a programming language used to describe digital circuits and systems. It was developed in the 1980s by the U.S. Department of Defense as a standard for designing digital systems. VHDL is widely used in the field of electronic design automation (EDA) and is an essential tool for designing complex digital systems. VHDL and Verilog are the two languages digital designers use to describe their circuits, and they are different by design than your traditional software languages such as C and Java. VHDL and Verilog are used by education and business to design FPGAs and ASICs.

---

VHDL is a hardware description language that allows designers to describe digital circuits and systems using a textual format. It provides a way to describe the behavior of a circuit or system at different levels of abstraction, from high-level functional descriptions to low-level gate-level descriptions.

---

The language consists of two main parts: the entity declaration and the architecture body. The entity declaration defines the inputs and outputs of the circuit or system, while the architecture body describes how these inputs and outputs are connected together to form the circuit or system.

---

VHDL also includes a rich set of data types, including integers, booleans, arrays, records, and enumerations. These data types allow designers to create complex data structures that can be used to model real-world systems.

---

One of the key features of VHDL is its ability to simulate digital circuits and systems before they are implemented in hardware. This allows designers to test their designs and identify potential problems before they are built. VHDL simulators can also be used to verify that a design meets its specifications and requirements.

---

Another important feature of VHDL is its support for hierarchical design. This means that designers can break down complex systems into smaller subsystems, each with its own entity declaration and architecture body. This makes it easier to manage large designs and allows designers to reuse existing components in new designs.

---

In conclusion, VHDL is an essential tool for designing complex digital systems. It provides a way for designers to describe circuits and systems using a textual format, simulate them before they are built, and verify that they meet their specifications and requirements. VHDL's support for hierarchical design also makes it easier to manage large designs and reuse existing components. As digital systems continue to become more complex, VHDL will remain a critical tool for electronic design automation.

---

### __In this tutorial we will dive into VHDL and how to use it to design a digital system.__
#### (Note: This tutorial requires a good knowledge in logic and logic circuits)
---

## Let’s star

---

Let’s impalement this circuit
d value is determined by a logically ANDing a with b
e value is determined by a logically ORing d with c
f is just negation of e

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/vhdl1.jpg)

---

### __VHDL Code Structure__

---

```vhdl
library ieee;
```
The IEEE libray describes the definitions of logic values to be used in electronic design automation, for the VHDL hardware description language.

```vhdl
use ieee.std_logic_1164.all;
```
This IEEE standard for describing digital logic values in VHDL (IEEE STD 1164). It contains definitions for std_logic (single bit) and for std_logic_vector (array).

```vhdl
entity lecture0 is
    port( a: in std_logic; b: in std_logic; c: in std_logic;
          f: out std_logic);
end lecture0;
```
The entity declaration gives the name lecture0 to the module. The port declaration. Specifies the inputs and outputs to the module. a, b , and c are input signals type std_logic. f is an output signal of the type std_logic.


```vhdl
architecture lecture0_arch of lecture0 is
    signal d, e: std_logic;
    begin
        d <= a and b;
        e <= d or c;
        f <= not e;
end architecture lecture0_arch;
```
The architecture is named lecture0_arch. The signals d and e are declared within the architecture because they are internal signals. The concurrent statements that describe the gates are placed between the keywords begin and end.

### __code__

```vhdl
-- specifies that the IEEE library will be used in this code.
library ieee;
-- imports all the standard logic types from the IEEE library.
use ieee_std_logic_1164.all;

-- entity is a black box wich we define the shape of inputs and outputs  at 
entity lecture0 is
    port( a: in std_logic; b: in std_logic; c: in std_logic;
          f: out std_logic);
end lecture0;

-- architecture is where we define the functionality of the black box.
architecture lecture0_arch of lecture0 is
    signal d, e: std_logic;
    begin
        d <= a and b;
        e <= d or c;
        f <= not e;
end architecture lecture0_arch
```