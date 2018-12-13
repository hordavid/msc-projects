-- File /home/HN9W0P/AB/hf3_uj/lang/ada/adder.adb
-- generated by Atelier-B/blk on Sat May 14 03:03:14 2016
-- from input file /home/HN9W0P/AB/hf3_uj/lang/ada/adder.bod
-- WARNING : "sets#T_1" has been renamed into "array_type_1"
-- WARNING : "sets#T_2" has been renamed into "array_type_1"
-- File adder.bod
-- generated by Atelier-B/tbada on Sat May 14 03:03:14 2016
-- from input_file adder.imp, checksum dd671f870c1a47c6996106bc316f9398

-- adder_i
-- * Author: 
-- * Creation date: 2016.05.13.
-- 
package body adder is
	
	--------------------
	-- INITIALISATION --
	--------------------
	procedure IMPORTS(this : in PTR_adder) is
	begin
		-- Component does not import any machine
		null ;
		-- Component does not extend any machine
		null ;
		-- Instance is not initialised
		this.initialisation := FALSE ;
	end IMPORTS ;
	procedure INITIALISATION(this : in PTR_adder) is
	begin
		if (this.initialisation = TRUE)
		then
			return ;
		end if ;
		this.initialisation := TRUE ;
	end INITIALISATION ;
	----------------
	-- OPERATIONS --
	----------------
	procedure f_osszead(
		this : in PTR_adder ;
		in_tomb: in array_type_1 ;
		osszeg: in out INTEGER) is
		ii : INTEGER ;
		ossz : INTEGER ;
		akt : INTEGER ;
		maradek : INTEGER ;
		-- The following variable(s) have been added
		-- in order to avoid aliasing problems when
		-- arrays are being used as in parameters
		tomb : array_type_1 :=
			in_tomb ;
	begin
		ii := 1 ;
		ossz := 0 ;
		akt := 1 ;
		maradek := 0 ;
		while (ii <= 10) loop
			akt :=
				tomb(ii) ;
			maradek := akt mod 2 ;
			if (maradek = 1)
			then
				ossz := ossz +
					akt ;
			end if ;
			ii := ii + 1 ;
		end loop ;
		osszeg := ossz ;
	end f_osszead ;
	
end adder ;
