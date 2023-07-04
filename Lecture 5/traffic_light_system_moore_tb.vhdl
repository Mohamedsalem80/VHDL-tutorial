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