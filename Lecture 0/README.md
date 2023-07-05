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

### __Code__

#### __1. Syntax:__
VHDL follows a structured syntax that consists of entities, architectures, and processes. An 
entity represents the interface or external view of a design component, while an architecture 
describes its internal implementation. Processes define concurrent actions within an 
architecture
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

#### __2. Data Types:__
VHDL supports various data types for representing different kinds of information. These include standard types like integer, real, boolean, character, and time. Additionally, VHDL allows users to define their own custom data types using records or arrays.
The STD_LOGIC and STD_LOGIC_VECTOR data types are not built-in VHDL data types, but are defined in the standard logic 1164 package of the IEEE library. We therefore need to include this library in our VHDL code and specify that the STD_LOGIC_1164 package must be used in order to use the STD_LOGIC data type.

__BIT__

The BIT data type can only have the value 0 or 1. When assigning a value of 0 or 1 to a BIT in VHDL code, the 0 or 1 must be enclosed in single quotes: '0' or '1'.

__BIT_VECTOR__

The BIT_VECTOR data type is the vector version of the BIT type consisting of two or more bits. Each bit in a BIT_VECTOR can only have the value 0 or 1. When assigning a value to a BIT_VECTOR, the value must be enclosed in double quotes, e.g. "1011" and the number of bits in the value must match the size of the BIT_VECTOR.

__STD_LOGIC__

The STD_LOGIC data type can have the value X, 0, 1 or Z. There are other values that this data type can have, but the other values are not synthesizable – i.e. they can not be used in VHDL code that will be implemented on a CPLD or FPGA.

#### These values have the following meanings:
- X – unknown
- 0 – logic 0
- 1 – logic 1
- Z – high impedance (open circuit) / tristate buffer

When assigning a value to a STD_LOGIC data type, the value must be enclosed in single quotes: 'X', '0', '1' or 'Z'.

__STD_LOGIC_VECTOR__

The vector version of the STD_LOGIC data type. Each bit in the set of bits that make up the vector can have the value X, 0, 1 or Z. When assigning a value to a STD_LOGIC_VECTOR type, the value must be enclosed in double quotes, e.g. "1010", "ZZZZ" or "ZZ001". The number of bits in the value must match the size of the STD_LOGIC_VECTOR.

#### __3. Operators:__
VHDL provides a wide range of operators for performing arithmetic operations (addition, subtraction, multiplication), logical operations (AND, OR), relational comparisons (equal to, less than), and bit-wise operations (shift left/right). These operators enable designers to manipulate data efficiently within their designs.
Logical Operators
- NOT, AND, NAND, OR, NOR, XOR and XNOR.

__Arithmetic Operators__
- \+ addition
- \- subtraction
- \* multiplication
- / division
- ABS absolute value
- MOD modulus
- REM remainder
- ** exponent

__Comparison Operators__
- = equal to
- /= not equal to
- < less than
- \> greater than
- <= less than or equal to
- \>= greater than or equal to

__Shift Operators__
- sll – shift left logical
- srl – shift right logical
- sla – shift left arithmetic
- sra – shift right arithmetic
- rol – rotate left
- ror – rotate right

The following operators can be used on the data types listed.

#### Logical Operators
Logical operators can operate on: (BIT and BIT_VECTOR) (STD_LOGIC and STD_LOGIC_VECTOR) (STD_ULOGIC and STD_ULOGIC_VECTOR)

#### Arithmetic Operators
The STD_LOGIC_VECTOR data type can be used in addition and subtraction operations (+ and -) if the STD_LOGIC_SIGNED or the STD_LOGIC_UNSIGNED package of the IEEE library is used.
(Otherwise the arithmetic operators can only be used with INTEGER, SIGNED and UNSIGNED data types)

#### Comparison Operators
(BIT and BIT_VECTOR) (STD_LOGIC and STD_LOGIC_VECTOR) (STD_ULOGIC, STD_ULOGIC_VECTOR, INTEGER, SIGNED and UNSIGNED)

#### Shift Operators
Shift operators can only be used on BIT_VECTOR data types.

#### __4. Control Structures:__
Control structures in VHDL allow designers to control the flow of execution within their designs. The most commonly used control structures are if-then-else statements and case statements. These structures enable conditional branching based on certain conditions or values.

#### I. Conditional Statements:
Conditional statements are used to make decisions based on certain conditions. The most commonly used conditional statement in VHDL is the "if-then-else" statement. It allows designers to execute different sets of instructions based on whether a condition is true or false. For example:
```vhdl
if (condition1) then
   -- execute these statements if condition1 is true
elsif (condition2) then
   -- execute these statements if condition2 is true
else
   -- execute these statements if all conditions are false
end if;
```

The "case" statement is another type of conditional statement that allows designers to select one action from multiple alternatives based on the value of an expression.
```vhdl
signal S1 : INTEGER range 0 to 7;
signal I1, I2, I3 : BIT ;
process (S1, I1, I2, I3)
begin
    case S1 is
        when 0 | 2 =>
            OU <= ‘0’ ;
        when 1 =>
            OU <= I1 ;
        when 3 to 5 =>
            OU <= I2 ;
        when others =>
            OU <= I3 ;
    end case ;
end process ;
```

#### I. Loop Statements:
Loop statements are used to repeat a set of instructions multiple times until a specific condition is met. The two main loop statements in VHDL are "for" and "while" loops.
The "for" loop executes a set of instructions for a fixed number of iterations, as defined by the loop index variable. For example:
``` vhdl
for i in 0 to 10 loop
   -- execute these statements for each iteration
end loop;
```

The "while" loop executes a set of instructions repeatedly as long as a given condition remains true. For example:
```vhdl
while (condition) loop
   -- execute these statements until condition becomes false
end loop;
```

#### III. Sequential Statements:
Sequential statements allow designers to specify the order in which certain actions should be executed. The most commonly used sequential statement in VHDL is the "wait" statement. It suspends the execution of a process until a specific condition is met, such as a certain amount of time has passed or an event occurs.
```vhdl
wait for 10 ns; -- suspend execution for 10 nanoseconds
```

Another important sequential statement is the "next" statement, which allows designers to skip the remaining statements within a loop and proceed to the next iteration.
```vhdl
l1 : while a < 10 loop
    l2 : while b < 20 loop
        next l1 when a = b ;
    end loop l2 ;
end loop l1 ;
```