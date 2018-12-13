/* Név: Horváth Dávid 
 * Neptun-kód: IYB4JH
 *
 * Egy olyan szoftvernek a specifikációját kell elkészíteni, amely képes egy vállalkozás vezetőjének a munkáját
 * támogatni az alábbi funkciókkal:
 *   - a szoftver tartsa nyilván a napi bevételi adatokat egy hétre vonatkozóan (7 nap),
 *   - rendelkezzen az adatok megadásához szükséges műveletekkel,
 *   - számolja ki, hogy az adott héten mekkora volt az összbevétel,
 *   - adja meg, hogy mely napon volt a legtöbb bevétel,
 *   - adja meg, hogy mely napon volt a legkevesebb bevétel.
 */
MACHINE
    incomes_m

CONCRETE_VARIABLES
    incomes
    , min_d
    , max_d
    , sum_i

INVARIANT
    incomes : ( 1 .. 7 ) --> ( 0 .. 1000000 )

    & min_d : 1 .. 7
    & max_d : 1 .. 7
    & sum_i : 0 .. 1000000 * 7

    // létezik olyan ii index (nap), amikor a legtöbb bevétel volt
    & ! jj . ( jj : dom ( incomes ) => incomes ( jj ) >= incomes ( max_d ) )

    // létezik olyan ii index (nap), amikor a legkevesebb bevétel volt
    & ! jj . ( jj : dom ( incomes ) => incomes ( jj ) <= incomes ( min_d ) )

    // sum kiszámítása
    & sum_i = SIGMA ( ii ) . ( ii : dom ( incomes ) | incomes ( ii ) )

INITIALISATION
    incomes := ( 1 .. 7 ) * { 0 }
    || min_d := 1
    || max_d := 1
    || sum_i := 0

OPERATIONS

    // egy adott napi bevétel lekérése
    income <-- get_income ( day ) =
        PRE
            day : dom ( incomes ) &
            income : 0 .. 1000000 &
            incomes ( day ) : 0 .. 1000000
        THEN
            income := incomes ( day )
        END ;

    // egy adott napi bevétel rögzítése
    set_income ( day , income ) =
        PRE
            day : dom ( incomes ) &
            income : 0 .. 1000000 &
            incomes ( day ) : 0 .. 1000000
        THEN
            ANY
                t_incomes ,
                t_min ,
                t_max ,
                t_sum
            WHERE
                t_incomes : ( 1 .. 7 ) --> ( 0 .. 1000000 ) &
                t_min : 1 .. 7 &
                t_max : 1 .. 7 &
                t_sum : 0 .. 1000000 * 7 &

                ! jj . ( jj : dom ( t_incomes ) => t_incomes ( jj ) >= t_incomes ( t_max ) ) &

                ! jj . ( jj : dom ( t_incomes ) => t_incomes ( jj ) <= t_incomes ( t_min ) ) &

                t_sum = SIGMA ( ii ) . ( ii : dom ( t_incomes ) | t_incomes ( ii ) ) &

                t_incomes = incomes <+ { day |-> income }
            THEN
                incomes := t_incomes || sum_i := t_sum || min_d := t_min || max_d := t_max
            END
        END ;

    // heti bevétel összege
    sum <-- sum_incomes = sum := sum_i ;

    // a legmagasabb bevétel napja
    max_income_day <-- maximum = max_income_day := max_d ;

    // a legkisebb bevétel napja
    min_income_day <-- minimum = min_income_day := min_d
END
