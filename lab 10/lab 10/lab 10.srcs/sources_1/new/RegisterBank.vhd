----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2023 06:52:03 AM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
       RegSel : in STD_LOGIC_VECTOR(2 downto 0);
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       R0, R1, R2, R3, R4, R5, R6, R7 : out STD_LOGIC_VECTOR(3 downto 0));
end RegisterBank;

architecture Behavioral of RegisterBank is
    component D_FF_4bit
        port (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Res : in STD_LOGIC;
            En : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
    end component;
    
    component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal T : STD_LOGIC_VECTOR(7 downto 0);
    signal Clk_slow : STD_LOGIC;
    
begin
    
    Slow_Clk_0 : Slow_Clk 
    port map(
        Clk_in => Clk,
        Clk_out => Clk_slow );
        
    Decoder_3_to_8_0 : Decoder_3_to_8
        port map(
            I => RegSel,
            EN => '1',
            Y => T );
            
    R0 <= "0000";  
        
    R_1 : D_FF_4bit
        port map (
            D => D,
            Res => Res,
            En => T(1),
            Clk => Clk_slow,
            Q => R1 ); 
                    
    R_2 : D_FF_4bit
        port map (
            D => D,
            Res => Res,
            En => T(2),
            Clk => Clk_slow,
            Q => R2 );  
                    
    R_3 : D_FF_4bit
        port map (
            D => D,
            Res => Res,
            En => T(3),
            Clk => Clk_slow,
            Q => R3 );  
                
    R_4 : D_FF_4bit
        port map (
            D => D,
            Res => Res,
            En => T(4),
            Clk => Clk_slow,
            Q => R4 ); 
                            
    R_5 : D_FF_4bit
        port map (
            D => D,
            Res => Res,
            En => T(5),
            Clk => Clk_slow,
            Q => R5 ); 
                            
    R_6 : D_FF_4bit
        port map (
            D => D,
            Res => Res,
            En => T(6),
            Clk => Clk_slow,
            Q => R6 ); 
                                    
    R_7 : D_FF_4bit
        port map (
            D => D,
            Res => Res,
            En => T(7),
            Clk => Clk_slow,
            Q => R7 );  

end Behavioral;
