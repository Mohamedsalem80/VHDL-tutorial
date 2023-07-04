# __Introduction to VHDL__

![Starry Night Logic](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/starrynightlogic.jpeg)

---

__Mohamed Salem Mohamed__

Drive: https://drive.google.com/drive/folders/19KyYJOgZSFlZfGzc6FWgkRxtoCVd9kQp?usp=sharing

---
### Lecture 5
---

### __In the previous lecture we started sequential circuits you can train more by implementing all the flip flops (D, T, JK). Next step is FSM (Finite State Machine). We will implement a simple traffic light system using Mealy and Moore.__


### __Introduction:__


Finite State Machines (FSMs) are powerful tools used in computer science and engineering to model and analyze systems with discrete states. They play a crucial role in various applications, including digital circuit design, software development, and artificial intelligence. This article aims to provide a comprehensive understanding of two popular types of FSMs: Mealy machines and Moore machines. We will explore their working principles, differences, and practical applications.
I. What is a Finite State Machine?
A Finite State Machine is a mathematical model that represents a system with a finite number of states. It consists of states, transitions, inputs, outputs, and an initial state. FSMs are widely used to describe the behavior of systems that change from one state to another based on inputs.
II. Mealy Machines:
A Mealy machine is an FSM where the output depends on both the current state and the input received at that particular moment. In other words, the output is associated with each transition between states rather than being linked solely to the current state.
1. Working Principle:
- The Mealy machine's behavior is defined by its transition function, which determines the next state based on the current state and input.
- Additionally, it defines the output produced during each transition.
- The output function in Mealy machines is represented as O = f(Si,Xi), where O denotes the output produced during transition i from state Si to Si+1 upon receiving input Xi.
2. Key Features:
- Mealy machines are known for their ability to produce outputs that depend on both current states and inputs.
- They have fewer states compared to Moore machines for achieving similar functionality.
- Due to their output dependency on inputs, Mealy machines can respond faster than Moore machines in certain scenarios.
III. Moore Machines:
A Moore machine is another type of FSM where outputs are solely determined by the current state. Unlike Mealy machines, Moore machines do not consider inputs when generating outputs.
1. Working Principle:
- The behavior of a Moore machine is defined by its transition function, which determines the next state based on the current state and input.
- The output function in Moore machines is represented as O = g(Si), where O denotes the output produced during state Si.
2. Key Features:
- Moore machines are known for their simplicity and ease of implementation.
- They have more states compared to Mealy machines for achieving similar functionality since outputs are not associated with transitions.
- Due to their output dependency on states only, Moore machines are generally more predictable and easier to debug.
IV. Practical Applications:
Both Mealy and Moore machines find applications in various domains, including:
1. Digital Circuit Design:
- FSMs are extensively used in designing digital circuits like counters, shift registers, and control units.
- They help in modeling sequential logic systems and designing efficient hardware implementations.
2. Software Development:
- FSMs play a crucial role in software development for tasks such as parsing, lexical analysis, protocol handling, and workflow management.
- They provide a structured approach to handle complex scenarios with discrete states.

### __Conclusion:__
Finite State Machines (FSMs) are invaluable tools for modeling systems with discrete states. Mealy machines and Moore machines represent two popular types of FSMs that differ in terms of output generation principles. While Mealy machines produce outputs based on both current states and inputs, Moore machines generate outputs solely based on the current state. Understanding these concepts is essential for effectively utilizing FSMs in various applications ranging from digital circuit design to software development.


### __Now let’s implement the traffic light system using Moore:__

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity traffic_light_system_moore is 
    port(
        clk,reset,enable: in std_logic;
        red,yellow,green: out std_logic
    );
end traffic_light_system_moore;

architecture moore of traffic_light_system_moore is

    type state is (red_state,yellow_state,green_state);

    signal current_state,next_state : state;
    signal out_red,out_yellow,out_green : std_logic;
    
    begin 
        process(clk,reset) 
            begin
                if(reset ='1') then 
                    current_state<=red_state;
                elsif rising_edge(clk) then
                    current_state<=next_state;
                end if;
        end process;

        process(current_state, enable)
            begin
                case current_state is
                    when red_state =>
                        if(enable ='1') then 
                            next_state<=yellow_state;
                        else 
                            next_state<=red_state;
                        end if;
                        out_red<='1';
                        out_yellow<='0';
                        out_green<='0';

                    when yellow_state =>
                        if(enable ='1') then 
                            next_state<=green_state;
                        else 
                            next_state<=yellow_state;
                        end if;
                        out_red<='0';
                        out_yellow<='1';
                        out_green<='0';

                    when green_state =>
                        if(enable ='1') then 
                            next_state<=red_state;
                        else 
                            next_state<=green_state;
                        end if;
                        out_red<='0';
                        out_yellow<='0';
                        out_green<='1';

                    when others =>
                        next_state<=red_state;
                        out_red<='1';
                        out_yellow<='0';
                        out_green<='0';
                end case;
        end process;
        red <= out_red;
        yellow <= out_yellow;
        green <= out_green;
end moore;
```

### __Note__
```vhdl
    type state is (red_state,yellow_state,green_state);
```
is defining a new data type called "state_type". This data type can have three possible values: "red_state", "green_state", and "yellow_state". This line is essentially creating an enumerated type in VHDL. Enumerated types allow you to define a set of named values that a variable of that type can take on. In this case, the "state_type" can only have one of the three specified values. This type definition is often used in VHDL to represent states in a finite state machine (FSM) or to define different modes or states in a system. By using an enumerated type, it becomes easier to understand and manipulate the different states within the design.

#### __Test Bench__

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity traffic_light_system_moore_tb is
end traffic_light_system_moore_tb;

architecture tb_arch of traffic_light_system_moore_tb is
    component traffic_light_system_moore
        port (
            clk     : in  std_logic;
            reset   : in  std_logic;
            enable  : in  std_logic;
            red     : out std_logic;
            yellow  : out std_logic;
            green   : out std_logic
        );
    end component;
    -- Constants
    constant clk_period: time := 20 ns;
    -- Signals
    signal clk: std_logic := '0';
    signal reset: std_logic := '1';
    signal enable: std_logic := '0';
    signal red, yellow, green: std_logic;
    begin
    -- Instantiate the traffic_light_system_moore component
    uut: traffic_light_system_moore
    port map (
        clk => clk,
        reset => reset,
        enable => enable,
        red => red,
        yellow => yellow,
        green => green
    );
    -- Clock generation process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;
    -- Stimulus process
    stimulus_process: process
    begin
        -- Reset
        enable <= '0';
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        -- Enable traffic light
        enable <= '1';
        wait for 40 ns;
        -- Disable traffic light
        -- enable <= '0';
        wait for 40 ns;
        -- Re-enable traffic light
        -- enable <= '1';
        wait for 40 ns;
        -- Disable traffic light
        -- enable <= '0';
        wait for 40 ns;
        -- Re-enable traffic light
        -- enable <= '1';
        wait for 40 ns;
        -- Disable traffic light
        -- enable <= '0';
        wait for 40 ns;
        -- Re-enable traffic light
        -- enable <= '1';
        wait for 40 ns;
        -- End simulation
        wait;
    end process;
end tb_arch;
```

#### __Visualization__
![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/ghdl7.png)
![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/state1.png)

---

### __Implementing the traffic light system using Mealy:__

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity traffic_light_system_mealy is
    port (
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;
        input : in std_logic;
        red : out std_logic;
        yellow : out std_logic;
        green : out std_logic
    );
end traffic_light_system_mealy;

architecture mealy of traffic_light_system_mealy is

    type state_type is (red_state, green_state, yellow_state);
    signal current_state, next_state: state_type;
    signal output_red, output_yellow, output_green: std_logic;
    begin
        process (clk, reset)
        begin
            if reset = '1' then
                current_state <= red_state;
            elsif rising_edge(clk) then
                current_state <= next_state;
            end if;
        end process;
        process (current_state, input)
        begin
            case current_state is
                when red_state =>
                    if enable = '1' then
                        if input = '1' then
                            next_state <= yellow_state;
                        end if;
                    else
                        next_state <= red_state;
                    end if; 
                    output_red <= '0';
                    output_yellow <= '0';
                    output_green <= '1'; 
                    
                when yellow_state =>
                    if enable = '1' then
                        if input = '1' then
                            next_state <= green_state;
                        end if;
                    else
                        next_state <= yellow_state;
                    end if; 
                    output_red <= '1';
                    output_yellow <= '0';
                    output_green <= '0';

                when green_state =>
                    if enable = '1' then
                        if input = '1' then
                            next_state <= red_state;
                        end if;
                    else
                        next_state <= green_state;
                    end if; 
                    output_red <= '0';
                    output_yellow <= '1';
                    output_green <= '0';
  
                when others =>
                    next_state <= red_state;
                    output_red <= '1';
                    output_yellow <= '0';
                    output_green <= '0';
            end case;
        end process;
    red <= output_red;
    yellow <= output_yellow;
    green <= output_green;
end mealy;
```

#### __Test Bench__

```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity traffic_light_system_mealy_tb is
end traffic_light_system_mealy_tb;

architecture tb_arch of traffic_light_system_mealy_tb is
    component traffic_light_system_mealy
        port (
            clk : in std_logic;
            reset : in std_logic;
            enable : in std_logic;
            input : in std_logic;
            red : out std_logic;
            yellow : out std_logic;
            green : out std_logic
        );
    end component;
    constant clk_period: time := 20 ns;

    signal clk: std_logic := '0';
    signal reset: std_logic := '1';
    signal enable: std_logic := '0';
    signal input: std_logic := '0';
    signal red, yellow, green: std_logic;

    begin
        uut: traffic_light_system_mealy
        port map (
            clk => clk,
            reset => reset,
            enable => enable,
            input => input,
            red => red,
            yellow => yellow,
            green => green
        );
    
        clk_process: process
        begin
            while now < 500 ns loop
                clk <= '0';
                wait for clk_period/2;
                clk <= '1';
                wait for clk_period/2;
            end loop;
        end process;

        stimulus_process: process
        begin
            reset <= '1';
            wait for 5 ns;

            reset <= '0';
            enable <= '1';
            wait for 10 ns;

            input <= '1';
            wait for 15 ns;

            input <= '0';
            wait for 10 ns;

            input <= '1';
            wait for 15 ns;

            input <= '0';
            enable <= '0';
            wait for 20 ns;

            enable <= '1';
            wait for 10 ns;

            input <= '1';
            wait for 15 ns;

            input <= '0';
            wait for 20 ns;
        end process;
end tb_arch;
```

#### __Visualization__

![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/ghdl8.png)
![vhdl](https://github.com/Mohamedsalem80/VHDL-tutorial/blob/main/assets/state2.png)