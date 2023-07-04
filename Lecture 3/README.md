# __Introduction to VHDL__

![Starry Night Logic](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/starrynightlogic.jpeg)

---

__Mohamed Salem Mohamed__

Drive: https://drive.google.com/drive/folders/19KyYJOgZSFlZfGzc6FWgkRxtoCVd9kQp?usp=sharing

---
### Lecture 3
---

### __Carrying on and implementing (Half - Full) Adders.__

---
#### __1- Half Adder__
The output “s” is the sum of a and b, and “c” is the c is the carry out.

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/vhdl4-1.jpg)

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity ha is
    port(
        a: in std_logic;
        b: in std_logic;
        s: out std_logic;
        c: out std_logic
    );
end ha;

architecture ha_arch of ha is
    begin 
        s<= a xor b;
        c<= a and b;
end ha_arch;
```

#### __Test Bench__

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity ha_tb is
end ha_tb;

architecture ha_tb_arch of ha_tb is
    component ha
        port(
            a: in std_logic;
            b: in std_logic;
            s: out std_logic;
            c: out std_logic
        );
    end component;

    signal a, b, s, c: std_logic; 

    begin
        ha0: ha port map(a=>a, b=>b, s=>s, c=>c);
    
        process
            begin
                a<='X';
                b<='X';
                wait for 10 ns;
                
                a<='0';
                b<='0';
                wait for 10 ns;

                a<='0';
                b<='1';
                wait for 10 ns;

                a<='1';
                b<='0';
                wait for 10 ns;

                a<='1';
                b<='1';
                wait for 10 ns;
        end process;
end ha_tb_arch;
```

#### __Visualization__
![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/ghdl4.png)

Now as we implemented the Half Adder there is two ways to implement the Full Adder

#### __2.1- Full Adder__

- We can implement the circuit directly (without signals) and combinationaly (with signals).

- From Boolean Algebra we find the final expression for “sum” and “cout” and implement them.

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/vhdl4-2.jpg)
![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/vhdl4-3.jpg)


```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fa is
    port (
        a, b, cin: in  std_logic;
        sum, cout: out std_logic
    );
end fa;

architecture fa_arch_1 of fa is
begin
    sum <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end fa_arch_1;

architecture fa_arch_2 of fa is
    signal s1, c1, c2: std_logic;
begin
    s1 <= a xor b;
    sum <= s1 xor cin;
    c1 <= a and b;
    c2 <= s1 and cin;
    cout <= c1 or c2;
end fa_arch_2;
```
Both architecture give the same output.


#### __2.2- Full Adder using the Half Adder__

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/vhdl4-4.jpg)

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fa is
    port (
        a, b, cin : in  std_logic;
        sum, cout : out std_logic
    );
end fa;

architecture arch_fa of fa is
    component ha is
        port (
            a, b : in  std_logic;
            sum, c : out std_logic
        );
        end component;
    signal s1, s2, c1, c2 : std_logic;
begin
    ha1: ha port map(a, b, s1, c1);
    ha2: ha port map(s1, cin, s2, c2);
    sum <= s2;
    cout <= c2 or c1;
end arch_fa;
```
Like we do in a test bench we make a component and we map through its inputs and outputs we do the same the main difference that a test bench does not have an architecture it just pass values and wait for the output but a component way architecture is to use other components to implement circuits.

--- 
### __Implementing up to 16-bit Adder using components method__

#### __4-bit Adder:__

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fba is
    port (
        a : in  std_logic_vector (3 downto 0);
        b : in  std_logic_vector (3 downto 0);
        cin : in  std_logic;
        sum : out  std_logic_vector (3 downto 0);
        cout : out std_logic
    );
end fba;

architecture arc_fba of fba is
    component fa is
        port (
            a, b, cin : in  std_logic;
            sum, cout : out std_logic
        );
        end component;
    signal c1, c2, c3, co: std_logic;
begin
    fa0: fa port map(a(0), b(0), cin, sum(0), c1);
    fa1: fa port map(a(1), b(1), c1, sum(1), c2);
    fa2: fa port map(a(2), b(2), c2, sum(2), c3);
    fa3: fa port map(a(3), b(3), c3, sum(3), co);
    cout <= co;
end arc_fba;
```

#### __8-bit Adder:__

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity eba is
    port (
        a : in  std_logic_vector (7 downto 0);
        b : in  std_logic_vector (7 downto 0);
        cin : in  std_logic;
        sum : out  std_logic_vector (7 downto 0);
        cout : out std_logic
    );
end eba;

architecture arc_eba of eba is
    component fba is
        port (
            a : in  std_logic_vector (3 downto 0);
            b : in  std_logic_vector (3 downto 0);
            cin : in  std_logic;
            sum : out  std_logic_vector (3 downto 0);
            cout : out std_logic
        );
    end component;
    signal c1, co: std_logic;
begin
    fba0: fba port map(a(3 downto 0), b(3 downto 0), cin, sum(3 downto 0), c1);
    fba1: fba port map(a(7 downto 4), b(7 downto 4), c1, sum(7 downto 4), co);
    cout <= co;
end arc_eba;
```

#### __16-bit Adder:__

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity sba is
    port (
        a : in  std_logic_vector (15 downto 0);
        b : in  std_logic_vector (15 downto 0);
        cin : in  std_logic;
        sum : out  std_logic_vector (15 downto 0);
        cout : out std_logic
    );
end sba;

architecture arc_sba of sba is
    component eba is
        port (
            a : in  std_logic_vector (7 downto 0);
            b : in  std_logic_vector (7 downto 0);
            cin : in  std_logic;
            sum : out  std_logic_vector (7 downto 0);
            cout : out std_logic
        );
    end component;
    signal c1, co: std_logic;
begin
    eba0: eba port map(a(7 downto 0), b(7 downto 0), cin, sum(7 downto 0), c1);
    eba1: eba port map(a(15 downto 8), b(15 downto 8), c1, sum(15 downto 8), co);
    cout <= co;
end arc_sba;
```