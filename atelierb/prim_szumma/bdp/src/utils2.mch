/* utils2
 * Author: Magnucz Ferenc
 * Neptun kód: NT76QQ
 * Creation date: 2016.05.15.
 *
 * Informal specification:
 * -----------------------
 * Segéd eljárások gyűjtőhelye.
 * 
 * prim_osszeg(tomb):
 * A tomb-ben lévő prímszámok összegét adja vissza.
 *
 * prim_darab(tomb):
 * A tomb-ben lévő prímszámok darabszámát adja vissza. 
 *
 */
MACHINE
    utils2




OPERATIONS

    ret <-- prim_osszeg ( tomb ) =
        PRE
                tomb : ( 1 .. 10 ) --> ( 1 .. 100 ) &
               dom ( tomb ) = 1 .. 10
        THEN
            ANY
                ss
            WHERE
                        ss : 0 .. 1000 &
                        ss = SIGMA ii . ( ii : 1 .. 10 | { TRUE |-> tomb ( ii ) , FALSE |-> 0 } ( bool ( ( 2 <= ( tomb ( ii ) ) ) & ! zz . ( zz : 2 .. ( ( tomb ( ii ) ) - 1 ) => ( ( ( tomb ( ii ) ) mod zz ) /= 0 ) ) ) ) ) &
                        SIGMA ii . ( ii : 1 .. 10 | { TRUE |-> tomb ( ii ) , FALSE |-> 0 } ( bool ( ( 2 <= ( tomb ( ii ) ) ) & ! zz . ( zz : 2 .. ( ( tomb ( ii ) ) - 1 ) => ( ( ( tomb ( ii ) ) mod zz ) /= 0 ) ) ) ) ) : 0 .. 1000
                THEN
                        ret := ss
                END
    END
    ;

    ret <-- prim_darab ( tomb ) =
    PRE
        tomb : ( 1 .. 10 ) --> ( 1 .. 100 ) &
        dom ( tomb ) = ( 1 .. 10 )
    THEN
        ANY
            darab
        WHERE
            darab : 0 .. 10 &
            darab = SIGMA ( ii ) . ( ii : ( 1 .. 10 ) | { TRUE |-> 1 , FALSE |-> 0 } ( bool ( ( 2 <= ( tomb ( ii ) ) ) & ! zz . ( zz : 2 .. ( ( tomb ( ii ) ) - 1 ) => ( ( ( tomb ( ii ) ) mod zz ) /= 0 ) ) ) ) ) &
            SIGMA ( ii ) . ( ii : ( 1 .. 10 ) | { TRUE |-> 1 , FALSE |-> 0 } ( bool ( ( 2 <= ( tomb ( ii ) ) ) & ! zz . ( zz : 2 .. ( ( tomb ( ii ) ) - 1 ) => ( ( ( tomb ( ii ) ) mod zz ) /= 0 ) ) ) ) ) : 0 .. 10
                THEN
                ret := darab
                END
    END
END
