----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 06:07:47 PM
-- Design Name: 
-- Module Name: Mux_8way_4bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_8way_4bit is
    Port ( Clk : in STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           A,B,C,D,E,F,G,H : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end Mux_8way_4bit;

architecture Behavioral of Mux_8way_4bit is

begin

    process(Clk,Sel)
        begin
            if (rising_edge(Clk)) then 
            case Sel is
                when "000" =>  Y <= A;
                when "001" =>  Y <= B;
                when "010" =>  Y <= C;
                when "011" =>  Y <= D;
                when "100" =>  Y <= E;
                when "101" =>  Y <= F;
                when "110" =>  Y <= G;
                when "111" =>  Y <= H;
                when others => Y <= "UUUU";
            end case;
            end if;
            
    end process;
end Behavioral;
