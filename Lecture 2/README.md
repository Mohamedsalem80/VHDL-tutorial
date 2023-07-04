# __Introduction to VHDL__

![Starry Night Logic](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/starrynightlogic.jpeg)

---

__Mohamed Salem Mohamed__

Drive: https://drive.google.com/drive/folders/19KyYJOgZSFlZfGzc6FWgkRxtoCVd9kQp?usp=sharing

---
### Lecture 2
---

### __WE will continue on this tutorial by understanding what a test bench is and how to generate a waveform for our test bench to check out logic circuit.__

---
We will fast-forward implementing this circuit as VHDL code and focus on the test bench

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/vhdl3.jpg)

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity compo is 
    port (
        a: in std_logic;
        b: in std_logic;
        not_a: out std_logic;
        a_and_b: out std_logic;
        a_or_b: out std_logic;
        a_xor_b: out std_logic
    );
end compo;

architecture compo_arch of compo is
    begin
        not_a <= not a;
        a_and_b <= a and b;
        a_or_b <= a or b;
        a_xor_b <= a xor b;
end compo_arch;
```

### __Test Bench__

As usual we use the IEEE library

```vhdl
library ieee;
use ieee.std_logic_1164.all;
```

Then we make an empty entity for the test bench
```vhdl
entity compo_tb is
end compo_tb;
```
Now we define an architecture for the test bench
```vhdl
architecture compo_tb_arch of compo_tb is
```

One of the new things is we make a component of our compo entity
```vhdl
component compo
```

Then we define this component ports
```vhdl
    port (
        a: in std_logic;
        b: in std_logic;
        not_a: out std_logic;
        a_and_b: out std_logic;
        a_or_b: out std_logic;
        a_xor_b: out std_logic
    );
```

End the component
```vhdl
end component;
```

Secondly, we make signal for all the input and output to connect this signal between the entity and the test bench so we could map through them
```vhdl
    signal a, b, not_a, a_and_b, a_or_b, a_xor_b: std_logic;
```

Now we begin our architecture
```vhdl
    begin
```

Thirdly, we make a variable "com0" for example then we put a ":" then write the entity type/name "compo" then "port map" to map the signals through the entity inputs and outputs then list them in the same order as defined in the entity
```vhdl
    com0: compo port map (a, b, not_a, a_and_b, a_or_b, a_xor_b);
```

Fourthly, we begin what is called a process that we will use to assign values for the inputs
```vhdl
    process
        begin
```

Now we start assigning values for the inputs and wait for certain time to see the output.
Usually we try assigning all the cases for the inputs to assure that the entity is probably working.
```vhdl
            a<='0';
            b<='0';
            wait for 10 ns;
            
            a<='1';
            b<='0';
            wait for 10 ns;
            
            a<='0';
            b<='1';
            wait for 10 ns;
            
            a<='1';
            b<='1';
            wait for 10 ns;
```

Finally we end the process and the architecture
```vhdl
    end process;
end compo_tb_arch;
```
---
### Test Bench
```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity compo_tb is
end compo_tb;

architecture compo_tb_arch of compo_tb is
    component compo 
        port (
            a: in std_logic;
            b: in std_logic;
            not_a: out std_logic;
            a_and_b: out std_logic;
            a_or_b: out std_logic;
            a_xor_b: out std_logic
        );
    end component;

    signal a, b, not_a, a_and_b, a_or_b, a_xor_b: std_logic;

    begin
        com0: compo port map (a, b, not_a, a_and_b, a_or_b, a_xor_b);

    process
        begin
            a<='0';
            b<='0';
            wait for 10 ns;

            a<='1';
            b<='0';
            wait for 10 ns;

            a<='0';
            b<='1';
            wait for 10 ns;

            a<='1';
            b<='1';
            wait for 10 ns;
    end process;
end compo_tb_arch;
```

---

### __Visualization__

There is so many ways to visualize the test bench we will use gtkwave and a vscode extension.
Personally I prefer the vscode ext. (WaveTrace). We will use GHDL to analyze, synthesize, elaborate, and run the VHDL code.
To make sure that out VHDL code is working test its syntax and run it using GHDL.
When you make a VHDL file the file name should be the same as the entity. In the containing folder run a command line and write

```properties
> ghdl -a compo.vhdl
>
```
"ghdl" is a VHDL compiler "-a" to analyze the code at "compo.vhdl" file

```properties
> ghdl -s compo.vhdl
>
```
"ghdl" is a VHDL compiler "-a" to synthesize the code at "compo.vhdl" file
These two are used to check out syntax errors.

```properties
> ghdl -e compo.vhdl
>
```
"ghdl" is a VHDL compiler "-e" to elaborate the code of "compo" entity and it creates an executable containing the code of the VHDL sources.
Now as we have our entity analyzed, synthesized, and elaborated we do the same for the test bench and we run the test bench creating the vcd(Value Change Dump) file which we will use to see the wave form.

```properties
> ghdl -a compo_tb.vhdl
> ghdl -s compo_tb.vhdl
> ghdl -e compo_tb
```
### To generate the vcd we run the following command

```properties
> ghdl -r compo_tb.vhdl --vcd=compo_tb.vcd --stop-time=100	0ns
> 
```
"ghdl" is a VHDL compiler "-r" to run the code at "compo_tb.vhdl" file "--vcd=compo_tb.vcd" to output the run of the code as vcd file named "compo_tb.vcd", "--stop-time=1000ns" the GHDL compiler keeps running the code iteratively so need to set a timer to stop the iteration or it will carry on forever (till the disk is full or the computer crashes).

---

After running the command a compo_tb.vcd file will be generated open it using vscode after installing WaveTrace extension.

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/ghdl1.png)

 
It will look like this choose add signals and add all the inputs and outputs. Verifying the values of the outputs by eye to the expected we make sure that is correct.

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/ghdl2.png)

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/ghdl3.png)

(Note: as you see it keeps cycling every 40ns and it will stop after 1000ns)

---

As for Gtkwave. After installing it and setting it up. Open the command line in the containing folder and run:

```properties
> gtkwave compo_tb.vhdl
>
```

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/thdl1.png)

Drag and drop the signals to show them

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/thdl2.png)
