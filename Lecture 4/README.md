# __Introduction to VHDL__

![Starry Night Logic](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/starrynightlogic.jpeg)

---

__Mohamed Salem Mohamed__

Drive: https://drive.google.com/drive/folders/19KyYJOgZSFlZfGzc6FWgkRxtoCVd9kQp?usp=sharing

---
### Lecture 4
---

### __In the previous lectures we implemented the circuits using the method structural implementing. It mean that we implement the structure from gates there is another method Behavioral, which mean we implement the behavior, what will the output be at every state of inputs. We introduce this method. It’s mostly used in sequential circuits which will be our next lecture. Behavioral Implementing depends on the truth table of the circuit. Full Adder using behavioral method:__

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/table1.png)

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fa is
    port (
        a, b, cin: in  std_logic;
        sum, cout: out std_logic
    );
end fa;

architecture fa_arch of fa is
begin
    process (a, b, cin)
    begin
        if a = '0' and b = '0'  and cin = '0' then
            sum <= '0';
            cout <= '0';
        elsif a = '0' and b = '0'  and cin = '1' then 
            sum <= '1';
            cout <= '0';
        elsif a = '0' and b = '1'  and cin = '0' then 
            sum <= '1';
            cout <= '0';
        elsif a = '0' and b = '1'  and cin = '1' then 
            sum <= '0';
            cout <= '1';
        elsif a = '1' and b = '0'  and cin = '0' then 
            sum <= '1';
            cout <= '0';
        elsif a = '1' and b = '0'  and cin = '1' then 
            sum <= '0';
            cout <= '1';
        elsif a = '1' and b = '1'  and cin = '0' then 
            sum <= '0';
            cout <= '1';
        elsif a = '1' and b = '1'  and cin = '1' then 
            sum <= '1';
            cout <= '1';
        end if;
    end process;
end fa_arch;
```

#### __Test Bench__

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fa_tb is
end fa_tb;

architecture fa_tb_arch of fa_tb is
    component fa
        port (
            a, b, cin: in  std_logic;
            sum, cout: out std_logic
        );
    end component;
    signal a, b, cin, sum, cout : std_logic;
    begin
        fa0: fa port map(a, b, cin, sum, cout);
        process
            begin
                a<='0';
                b<='0';
                cin<='0';
                wait for 10 ns;

                a<='1';
                b<='0';
                cin<='0';
                wait for 10 ns;

                a<='0';
                b<='1';
                cin<='0';
                wait for 10 ns;

                a<='1';
                b<='1';
                cin<='0';
                wait for 10 ns;

                a<='0';
                b<='0';
                cin<='1';
                wait for 10 ns;

                a<='1';
                b<='0';
                cin<='1';
                wait for 10 ns;
                
                a<='0';
                b<='1';
                cin<='1';
                wait for 10 ns;

                a<='1';
                b<='1';
                cin<='1';
                wait for 10 ns;
        end process;
end fa_tb_arch;
```

#### __Visualization__
![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/ghdl5.png)
As we see it has the same output signal as the combinational.

---

## __Sequential Circuits__

### __Introduction:__
Sequential circuits are an integral part of modern digital electronics, playing a crucial role in various applications such as computer processors, memory units, and communication systems. These circuits are designed to store and process information in a sequential manner, making them essential for performing complex tasks. In this article, we will delve into the working principles of sequential circuits, exploring their components and highlighting their significance in the realm of digital technology.

---
I. What are Sequential Circuits?
Sequential circuits are electronic circuits that utilize memory elements to store and process data over time. Unlike combinational circuits that solely rely on input values to produce output, sequential circuits incorporate feedback loops, enabling them to retain information from previous states. This ability to remember past inputs allows sequential circuits to exhibit memory and decision-making capabilities.

II. Components of Sequential Circuits:
1. Flip-Flops: The fundamental building blocks of sequential circuits are flip-flops. These bistable devices can store one bit of information (0 or 1) until a clock signal triggers a change in their output state.
2. Clock Signals: Sequential circuits rely on clock signals to synchronize the timing of operations within the circuit. The clock signal ensures that all changes occur at specific intervals, preventing data loss or corruption.
3. Registers: Registers are collections of flip-flops used for storing multiple bits of data simultaneously. They enable the storage and transfer of larger amounts of information within a circuit.
4. Counters: Counters are sequential circuits that generate a sequence of binary numbers based on clock pulses received as input signals.

III. Working Principles:
1. Synchronous Sequential Circuits: In synchronous sequential circuits, all flip-flops change their states simultaneously when triggered by the clock signal. This ensures that all changes occur at precisely defined moments.
2. Asynchronous Sequential Circuits: Asynchronous sequential circuits do not rely on clock signals for state changes. Instead, they utilize feedback loops and input signals to determine when to transition between states. Asynchronous circuits are more complex but offer advantages such as faster response times.

IV. Applications of Sequential Circuits:
1. Memory Units: Sequential circuits form the basis of memory units in computers, allowing for the storage and retrieval of data.
2. Processors: Modern processors extensively employ sequential circuits to execute instructions in a sequential manner, enabling complex computations.
3. Communication Systems: Sequential circuits play a vital role in communication systems by encoding and decoding data, ensuring reliable transmission.

---

### __Conclusion:__
Sequential circuits are indispensable components in the world of digital electronics, providing memory and decision-making capabilities that enable complex operations. By utilizing flip-flops, clock signals, registers, and counters, these circuits can store and process information sequentially. From memory units to processors and communication systems, sequential circuits find applications across various domains, driving technological advancements. Understanding their working principles is crucial for engineers and enthusiasts alike as we continue to push the boundaries of digital technology.

---

In our journey implementing sequential circuits will use behavioral method as its easier to implement (but not always faster) and it can handle invalid status in some circuits which can cause some structural implementations fail to output the right answer.

Starting our journey with the SR flip flop (S: set, R: Reset):

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/vhdl5.jpg)
![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/table2.png)

The invalid state happens when the set and the reset are high because the Q and Qbar will be high and that’s not possible the compliment can’t be same as output.

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity SRff is
  port (
    s, r, clk : in std_logic;
    q, qbar : inout std_logic
  );
end entity SRff;

architecture SRff_arch of SRff is
    begin
    process (clk)
        begin
            if rising_edge(clk) then
                if s = '0' and r = '0' then -- Hold condition
                    q <= q;
                    qbar <= not(q);
                elsif s = '0' and r = '1' then -- Reset condition
                    q <= '0';
                    qbar <= '1';
                elsif s = '1' and r = '0' then -- Set condition
                    q <= '1';
                    qbar <= '0';
                elsif s = '1' and r = '1' then -- Invalid condition
                    q <= 'X';
                    qbar <= 'X';
                end if;
            end if;
    end process;
end architecture SRff_arch;
```
The code starts with the library declaration, which includes the standard logic package (std_logic_1164). This package provides the necessary definitions for working with digital signals.
Next, the entity declaration for SRff is defined. It has three input ports: s, r, and clk (representing the set input, reset input, and clock input respectively), and two inout ports: q and qbar (representing the output and its complement).
The architecture declaration begins with the keyword "architecture" followed by the name of the architecture (SRff_arch) and the entity it is associated with (SRff).
Inside the architecture, there is a process statement that specifies that this process will be sensitive to changes in clk. This means that whenever there is a rising edge on clk, this process will be triggered.
Inside this process, there is an if statement that checks if there is a rising edge on clk. If true, it proceeds to check different conditions based on the values of s and r.
If s = '0' and r = '0', it represents a hold condition where both set and reset inputs are inactive. In this case, q remains unchanged by assigning it to itself using "<=". The complement output qbar is updated by assigning its negation using "not".
If s = '0' and r = '1', it represents a reset condition where only the reset input is active. In this case, q is forced to '0' using "<=", while qbar is forced to '1'.
If s = '1' and r = '0', it represents a set condition where only the set input is active. In this case, q is forced to '1', while qbar is forced to '0'.
If s = '1' and r = '1', it represents an invalid condition where both set and reset inputs are active. In this case, q and qbar are both assigned to 'X', which represents an unknown value.
After the if statement, the process ends. The architecture ends with the "end architecture" statement.

#### __Test Bench__

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity SRff_tb is
end SRff_tb;

architecture SRff_tb_arch of SRff_tb is
    component SRff 
        port(
            s, r, clk: in std_logic;
            q, qbar: inout std_logic
        );
    end component;

    signal s, r, clk, q, qbar: std_logic;

    begin
        SRff0: SRff port map (s, r, clk, q, qbar);

        process0: process
            begin
                while now < 500 ns loop
                    clk <= '1';
                    wait for 4 ns;
                    clk <= '0';
                    wait for 4 ns;
                end loop;
        end process;

        process1: process
        begin
            s <= '0';
            r <= '0';
            wait for 12 ns;

            s <= '0';
            r <= '1';
            wait for 12 ns;

            s <= '1';
            r <= '0';
            wait for 12 ns;

            s <= '1';
            r <= '1';
            wait for 12 ns;
    end process;
end SRff_tb_arch;
```

Inside the architecture, there is a component declaration for the SRff entity, which specifies its input and output ports, and a signal declaration is made for the ports of SRff: s, r, clk, q, and qbar. Then begin the architecture. 
The SRff0 instantiation instantiates an instance of SRff using the port map statement to connect signals to its ports.
The process0 process is defined next. Inside this process, there is a loop that runs until 500 ns (nanoseconds). In each iteration of the loop, clk is set to '1', then there is a wait for 4 ns, and then clk is set to '0' followed by another wait for 4 ns. This loop effectively generates a clock signal with a period of 8 ns (50% duty cycle) for 500 ns. After process0, there is process1 defined. Inside this process, there are four sets of assignments to s and r with corresponding waits in between each set. Each set represents a different combination of inputs (s and r) being applied to the flip-flop: (0, 0), (0, 1), (1, 0), and (1, 1).

#### __Visualization__

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/ghdl6.png)

The delay in output is because there are no old stored memory to show.