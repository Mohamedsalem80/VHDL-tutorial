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