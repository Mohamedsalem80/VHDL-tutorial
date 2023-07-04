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