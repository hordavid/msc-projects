/* m1
 * Author: Kispál István
 * Neptun kód: AWUD3U
 * Creation date: 2018.11.04.
 *
 * Informal specification:
 * -----------------------
 * Egy termosztát szoftverének a specifikációját kell elkészíteni, amelynek az alábbi követelményeket kell
 * megvalósítania:
 *  • 100 db mérési eredményt legyen képes eltárolni,
 *  • a mért eredmények megadásához rendelkezzen egy művelettel,
 *  • a géptől le lehessen kérdezni, hogy a megadott értékek között mi a maximális és minimális érték,
 *    valamint le lehessen kérdezni az értékek átlagát is,
 *  • az adatok folyamatosan érkeznek, a 101. adat érkezésekor a gép felejtse el a legrégebben megadott
 *    adatot.
 */
MACHINE
    m1
CONCRETE_VARIABLES
    // A méréseket tartalmazó queue
    measures

    // A queue megtelt-e már
    , isFull

    // Legkisebb elem indexe 
    , mini

    // Legnagyobb elem indexe
    , maxi

    // A queue-ban található elemek átlaga
    , mavg
INVARIANT
    // Maximum 100 elemet tartalmazó queue
    measures : 1 .. 100 +-> INT

    // A queue teltségére vonatkozó megkötések
    & isFull : BOOL
    & ( isFull = TRUE => card ( measures ) = 100 )
    & ( isFull = FALSE => card ( measures ) < 100 )

    & mini : 1 .. 100
    & maxi : 1 .. 100
    & mavg : INT

    //  Legkisebb elem indexének kiválasztása
    & ! jj . ( jj : 1 .. card ( measures ) & jj /= mini & card ( measures ) >= 2 => measures ( mini ) <= measures ( jj ) )

    // Legnagyobb elem indexének kiválasztása
    & ! jj . ( jj : 1 .. card ( measures ) & jj /= maxi & card ( measures ) >= 2 => measures ( maxi ) >= measures ( jj ) )

    // Átlag számítás ha nem üres a tömb
    & ( measures /= {} => mavg = SIGMA ii . ( ii : 1 .. card ( measures ) | measures ( ii ) ) / card ( measures ) )
INITIALISATION
    measures := {}
    || isFull := FALSE
    || mini := 1
    || maxi := 1
    || mavg := 0
OPERATIONS

    /* Új elem bevitele esetén a 101. elemnél az utolsót elfelejti */
    store ( item ) =
    PRE
        item : INT
    THEN
        ANY
            t_measures
            , t_isFull
            , t_mini
            , t_maxi
            , t_mavg
        WHERE
            t_measures : 1 .. 100 +-> INT
            & t_mini : 1 .. 100
            & t_maxi : 1 .. 100
            & t_mavg : INT
            & t_isFull : BOOL
            & ( t_isFull = TRUE => card ( t_measures ) = 100 )
            & ( t_isFull = FALSE => card ( t_measures ) < 100 )

            // Új elem érkezésekor ha tele van a queue, akkor minden elem egyel balra tolódik és az első ki is esik
            & ! jj . ( jj : ( 2 .. card ( measures ) ) & t_isFull = TRUE => t_measures = measures <+ { jj - 1 |-> measures ( jj ) } )

            // Új elem érkezésekor mindig a queue végére kerül az elem, ami maximum a 100. lehet
            & t_measures = measures <+ { card ( measures ) |-> item }

            // Min, max kiválasztés és avg számítás
            & ! jj . ( jj : 1 .. card ( t_measures ) & jj /= t_mini & card ( t_measures ) >= 2 => t_measures ( t_mini ) <= t_measures ( jj ) )
            & ! jj . ( jj : 1 .. card ( t_measures ) & jj /= t_maxi & card ( t_measures ) >= 2 => t_measures ( t_maxi ) >= t_measures ( jj ) )
            & ( t_measures /= {} => t_mavg = SIGMA ii . ( ii : 1 .. card ( t_measures ) | t_measures ( ii ) ) / card ( t_measures ) )
        THEN
            measures := t_measures || isFull := t_isFull || mini := t_mini || maxi := t_maxi || mavg := t_mavg
        END
    END ;

    /* Mért értékek átlagának lekérdezése */
    ret <-- average =
         PRE
        measures : 1 .. 100 +-> INT
    THEN
        ANY
            sum
             WHERE
                 // Elemek összegének összeszámolása
                 sum : INT
            & sum = SIGMA ii . ( ii : 1 .. card ( measures ) & measures /= {} | measures ( ii ) )
            & SIGMA ii . ( ii : 1 .. card ( measures ) & measures /= {} | measures ( ii ) ) : INT
        THEN
            ret := sum / card ( measures )
        END
    END ;

    /* Mért értékek minimumának lekérdezése */
    ret <-- minimum =
         PRE
        measures : 1 .. 100 +-> INT
    THEN
        ANY
            ii
             WHERE
                 ii : 1 .. 100 &
                 ! jj . ( jj : 1 .. card ( measures ) & jj /= ii & card ( measures ) >= 2 => measures ( ii ) <= measures ( jj ) )
        THEN
            ret := measures ( ii )
        END
    END ;

    /* Mért értékek maximumának lekérdezése */
    ret <-- maximum =
         PRE
        measures : 1 .. 100 +-> INT
    THEN
        ANY
            ii
             WHERE
                 ii : 1 .. 100 &
                 ! jj . ( jj : 1 .. card ( measures ) & jj /= ii & card ( measures ) >= 2 => measures ( ii ) >= measures ( jj ) )
        THEN
            ret := measures ( ii )
        END
    END

END
