----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 09:54:52 AM
-- Design Name: 
-- Module Name: Adder3Bit - Behavioral
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

entity Adder3Bit is
    Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
           S : out STD_LOGIC_VECTOR(2 downto 0));
end Adder3Bit;

architecture Behavioral of Adder3Bit is

    SIGNAL T : std_logic_vector(2 downto 0);
    
begin       
    
    T(0) <= '1';    
    S(0) <= A(0) XOR T(0);
    
    T(1) <= A(0) AND T(0);   
    S(1) <= A(1) XOR T(1);
    
    T(2) <= A(1) AND T(1); 
    S(2) <= A(2) XOR T(2);    
     
end Behavioral;

