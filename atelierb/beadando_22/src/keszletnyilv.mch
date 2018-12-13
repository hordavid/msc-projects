/* keszletnyilv
 * Author: norbert
 * neptun: E9QZF1
 * Creation date: 2018. 10. 19.
 */
 /*Definiáljuk egy gyár készletnyilvántartó rendszerét. A gyár 100 féle alkatrészt képes legyártani és ezeket raktározni. A készletnyilvántartó rendszer képes jelezni a gyártó egységnek, ha valamely termék készlete a tároló kapacitás 50%-a alá süllyed, valamint azt is, hogy hány db legyártására van szükség. A nyilvántartó rendszernek legyen egy betesz, és egy kivesz művelete, amelyeknek egyik paramétere az, hogy mely termékre vonatkozik az adott művelet. Az egyes alkatrészek tárolókapacitása: • Termék1: 1*500 db • Termék2: 2*500 db • Termék3: 3*500 db • ... • Termék100: 100*500 db 
 
A forráskód fejrészében egy komment blokkba legyen bemásolva a feladat szövege is. Feltölteni az archivált Atelier B projektet kell.*/

MACHINE
    keszletnyilv
VARIABLES
    slotok, jelzes, fogyoban_keszlet
INITIALISATION
    slotok := (1..100) * {0}
    || fogyoban_keszlet := %(kk).(kk:1..100 | kk*500)
    || jelzes := TRUE
INVARIANT
    slotok  : (1..100) --> (0..100*500)
    & fogyoban_keszlet  : (1..100) --> (0..100*500)
    & !(ii).(ii : 1..100 => fogyoban_keszlet(ii) = ii*500 - slotok(ii) )
    & !(ii).(ii: 1..100 => slotok(ii) : 0..ii*500)
    & jelzes : BOOL
    & (jelzes = TRUE => #(jj).((jj : 1..100) & slotok(jj) < ((jj*500) / 2)))
    & (jelzes = FALSE => !(kk).(kk : 1..100 => slotok(kk) >= ((kk*500) / 2)))
OPERATIONS
    betesz(slot, db) = 
	    PRE
    		slot : (1..100)
    		& db: 1..100*500
    		& slotok(slot)+db : 0..slot*500
    		& fogyoban_keszlet(slot)-db : 0..100*500
    	 THEN
        ANY t_jelzes,t_ii,t_slotok,t_fogyoban_keszlet
        WHERE
            t_jelzes : BOOL
            & t_ii : 1..100
            & t_slotok  : (1..100) --> (0..100*500)
            & t_fogyoban_keszlet  : (1..100) --> (0..100*500)
            & t_slotok = slotok<+{slot|->slotok(slot)+db}
            & t_fogyoban_keszlet = fogyoban_keszlet<+{slot|->fogyoban_keszlet(slot)-db}
            & (t_jelzes = TRUE => #(jj).((jj : 1..100) & t_slotok(jj) < ((jj*500) / 2)))
            & (t_jelzes = FALSE => !(kk).(kk : 1..100 => t_slotok(kk) >= ((kk*500) / 2)))
            & !(ii).(ii : 1..100 => t_fogyoban_keszlet(ii) = ii*500 - t_slotok(ii) )
            & !(ii).(ii: 1..100 => t_slotok(ii) : 0..ii*500)
        THEN
            slotok := t_slotok || fogyoban_keszlet := t_fogyoban_keszlet ||
            jelzes := t_jelzes
        END
     END;
    kivesz(slot,db)=
    PRE
    		slot : (1..100)
    		& db: 1..100*500
    		& slotok(slot)-db : 0..slot*500
    		& fogyoban_keszlet(slot)+db : 0..100*500
    	 THEN
        ANY t_jelzes,t_ii,t_slotok,t_fogyoban_keszlet
        WHERE
            t_jelzes : BOOL
            & t_ii : 1..100
            & t_slotok  : (1..100) --> (0..100*500)
            & t_fogyoban_keszlet  : (1..100) --> (0..100*500)
            & t_slotok = slotok<+{slot|->slotok(slot)-db}
            & t_fogyoban_keszlet = fogyoban_keszlet<+{slot|->fogyoban_keszlet(slot)+db}
            & (t_jelzes = TRUE => #(jj).((jj : 1..100) & t_slotok(jj) < ((jj*500) / 2)))
            & (t_jelzes = FALSE => !(kk).(kk : 1..100 => t_slotok(kk) >= ((kk*500) / 2)))
            & !(ii).(ii : 1..100 => t_fogyoban_keszlet(ii) = ii*500 - t_slotok(ii) )
            & !(ii).(ii: 1..100 => t_slotok(ii) : 0..ii*500)
        THEN
            slotok := t_slotok || fogyoban_keszlet := t_fogyoban_keszlet ||
            jelzes := t_jelzes
        END
     END;
    ret <-- fogyoban_keszlet_kiolvas(slot) =
    PRE slot : 1..100
    THEN ret := fogyoban_keszlet(slot)
    END
END
