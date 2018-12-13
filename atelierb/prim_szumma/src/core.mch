/* core
 * Author: Magnucz Ferenc
 * Neptun kód: NT76QQ
 * Creation date: 2016.05.15.
 *
 * Informal specification:
 * -----------------------
 * A bekért adatok között lévő prím számok összegét és darabszámát adja vissza.
 *
 */
MACHINE
    core
    
DEFINITIONS
    "common.def"

CONCRETE_VARIABLES
    tomb,
    darab,
    osszeg
INVARIANT
    tomb : (1..10) --> (1..100) &
    darab : 0..10 &
    osszeg : 0..1000
INITIALISATION
    darab := 0 ||
    tomb := (1..10) * {1} ||
    osszeg := 0
OPERATIONS
    beir =
    BEGIN
        ANY elem
        WHERE elem : (1..10) --> (1..100)
        THEN
            tomb := elem
        END
    END;
    
    muvelet =
    PRE
		tomb : (1..10) --> (1..100) &
        dom(tomb) = 1..10 
	THEN
	    ANY 
	        db, ossz 
	    WHERE
            db : 0..10
            & db = SIGMA(ii).(ii : (1..10) | {TRUE|-> 1, FALSE|-> 0}(bool(IS_PRIM(tomb(ii)))))
            & SIGMA(ii).(ii : (1..10) | {TRUE|-> 1, FALSE|-> 0}(bool(IS_PRIM(tomb(ii))))):0..10
		    
			& ossz : 0..1000
			& ossz = SIGMA ii.(ii:1..10 | {TRUE|->tomb(ii), FALSE|->0}( bool(IS_PRIM(tomb(ii))) ) )
			& SIGMA ii.(ii:1..10 | {TRUE|->tomb(ii), FALSE|->0}( bool(IS_PRIM(tomb(ii))) ) ): 0..1000
		THEN
			darab := db || osszeg := ossz
		END
	END;

    kiir = skip
END
