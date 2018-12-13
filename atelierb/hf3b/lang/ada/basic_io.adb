-- File /home/feri/AB40_ws1/hf3b/lang/ada/basic_io.adb
-- generated by Atelier-B/blk on Tue Apr 17 17:43:32 2018
-- from input file /home/feri/AB40_ws1/BASIC/trad/ada/basic_io.bod
--****************************************************************************
--
--Base machine BASIC_IO for ADA target language
--
--(C) 1996-1998 CLEARSY
--
-- Version @(#) basic_io.bod version 1.4 (date : 26 Nov 1996) 
--
--****************************************************************************
with TEXT_IO ;
use TEXT_IO ;

package body BASIC_IO is

package B_INTEGER_IO is new INTEGER_IO(INTEGER) ;
use B_INTEGER_IO ;

--------------------
-- INITIALISATION --
--------------------
procedure IMPORTS(this : in PTR_BASIC_IO) is
begin
	-- Instance is not initialised
	this.initialisation := FALSE ;
end IMPORTS ;

procedure INITIALISATION(this : in PTR_BASIC_IO) is
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
procedure INTERVAL_READ(
	this : in PTR_BASIC_IO ;
	mm: in INTEGER ;
	nn: in INTEGER ;
	bb: in out INTEGER) is
begin
	loop
	begin
	Get(bb) ;
	if ( (bb >= mm) and then (bb <= nn) )
	then
		return ;
	end if ;
	Put("THIS IS NOT A NUMBER in ") ;
	Put(mm,0) ;
	Put("..") ;
	Put(nn,0) ;
	New_Line ;		
exception 
	when others => 
	   	Put("THIS IS NOT A NUMBER in ") ;
	   	Put(mm,0) ;
	   	Put("..") ;
	   	Put(nn,0) ;
		New_Line ; 
	   	Put("Try again :") ;		
		SKIP_LINE(STANDARD_INPUT) ;
		end ;
	end loop ;
end INTERVAL_READ ;

procedure INT_WRITE(this : in PTR_BASIC_IO ; vv: in INTEGER) is
begin
	Put(vv, 0) ; -- 0 espaces avant le nombre
end INT_WRITE ;

procedure BOOL_READ(this : in PTR_BASIC_IO ; bb: in out BOOLEAN) is
	ss : STRING(1..6) ;
	ii : INTEGER ;
begin
	loop
		Get_Line(ss, ii) ;
		if ( (ii = 4) and then (ss(1..4) = "TRUE") )
		then
			bb := TRUE ;
			return ;
		end if ;
		if ( (ii = 5) and then (ss(1..5) = "FALSE") )
		then
			bb := FALSE ;
			return ;
		end if ;
		Put("THIS IS NOT A BOOL VALUE : type TRUE or FALSE :") ;
		SKIP_LINE(STANDARD_INPUT) ;
   	end loop ;
end BOOL_READ ;

procedure BOOL_WRITE(this : in PTR_BASIC_IO ; bb: in BOOLEAN) is
begin
	if (bb = TRUE)
	then
		Put("TRUE") ;
	else
		Put("FALSE") ;
    end if ;
end BOOL_WRITE ;

procedure CHAR_READ(this : in PTR_BASIC_IO ; cc: in out INTEGER) is
	ss : CHARACTER ;
begin
	loop
	begin
	Get(ss) ;
	cc := CHARACTER'POS(ss) ;
	SKIP_LINE(STANDARD_INPUT) ;
	return ;
exception 
	when others => 
		-- On suppose que c'est 0
	   	-- Put("THIS IS NOT A CHARACTER : try again : ") ;
		SKIP_LINE(STANDARD_INPUT) ;
		cc := 0 ;
		return ;
		end ;
	end loop ;
end CHAR_READ ;

procedure CHAR_WRITE(this : in PTR_BASIC_IO ; cc: in INTEGER) is
begin
	-- On ne gere pas les caracteres etendus
	if (cc = 0)
	then
		Put("EOF") ;
		return ;
	end if ;
	if  ( (cc <= 1) or else (cc >= 128) )
	then
		raise CONSTRAINT_ERROR ;
	end if ;
	Put(CHARACTER'VAL(cc)) ;
end CHAR_WRITE ;

procedure STRING_WRITE(this : in PTR_BASIC_IO ; ss: in STRING) is
	i : INTEGER;
begin
    i:=1;
    loop
	    exit when i>ss'LAST;
		if ss(i) = '\' then
		    i:= i+1;
		    exit when i>ss'LAST;
		    case ss(i) is
		    	when 'n' => New_Line;
			when 't' => Put(Ascii.HT);
			when 'E' => Put(Ascii.ESC);
			when 'B' => Put(Ascii.BEL);
			when '"' => Put('"');
			when Ascii.BACK_SLASH => Put(Ascii.BACK_SLASH);
			when others => Put(ss(i-1..i));
		    end case;
		else
		    Put(ss(i));
		end if;
		i:= i+1;
	end loop;
end STRING_WRITE ;


end BASIC_IO ;


