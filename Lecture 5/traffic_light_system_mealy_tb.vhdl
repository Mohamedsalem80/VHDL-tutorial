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