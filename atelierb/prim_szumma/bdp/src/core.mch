/* core
 * Author: 
 * Creation date: 2016.05.13.
 */
MACHINE
    core




CONCRETE_VARIABLES
    tomb ,
    darab ,
    osszeg
INVARIANT
    tomb : ( 1 .. 10 ) --> ( 1 .. 100 ) &
    darab : 0 .. 10 &
    osszeg : 0 .. 1000
INITIALISATION
    darab := 0 ||
    tomb := ( 1 .. 10 ) * { 1 } ||
    osszeg := 0
OPERATIONS
    beir =
    BEGIN
        ANY elem
        WHERE elem : ( 1 .. 10 ) --> ( 1 .. 100 )
        THEN
            tomb := elem
        END
    END ;

    muvelet =
    PRE
                tomb : ( 1 .. 10 ) --> ( 1 .. 100 ) &
        dom ( tomb ) = 1 .. 10
        THEN
            ANY
                db , ossz
            WHERE
            db : 0 .. 10
            & db = SIGMA ( ii ) . ( ii : ( 1 .. 10 ) | { TRUE |-> 1 , FALSE |-> 0 } ( bool ( ( 2 <= ( tomb ( ii ) ) ) & ! zz . ( zz : 2 .. ( ( tomb ( ii ) ) - 1 ) => ( ( ( tomb ( ii ) ) mod zz ) /= 0 ) ) ) ) )
            & SIGMA ( ii ) . ( ii : ( 1 .. 10 ) | { TRUE |-> 1 , FALSE |-> 0 } ( bool ( ( 2 <= ( tomb ( ii ) ) ) & ! zz . ( zz : 2 .. ( ( tomb ( ii ) ) - 1 ) => ( ( ( tomb ( ii ) ) mod zz ) /= 0 ) ) ) ) ) : 0 .. 10

                        & ossz : 0 .. 1000
                        & ossz = SIGMA ii . ( ii : 1 .. 10 | { TRUE |-> tomb ( ii ) , FALSE |-> 0 } ( bool ( ( 2 <= ( tomb ( ii ) ) ) & ! zz . ( zz : 2 .. ( ( tomb ( ii ) ) - 1 ) => ( ( ( tomb ( ii ) ) mod zz ) /= 0 ) ) ) ) )
                        & SIGMA ii . ( ii : 1 .. 10 | { TRUE |-> tomb ( ii ) , FALSE |-> 0 } ( bool ( ( 2 <= ( tomb ( ii ) ) ) & ! zz . ( zz : 2 .. ( ( tomb ( ii ) ) - 1 ) => ( ( ( tomb ( ii ) ) mod zz ) /= 0 ) ) ) ) ) : 0 .. 1000
                THEN
                        darab := db || osszeg := ossz
                END
        END ;

    kiir = skip
END
