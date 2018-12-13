/* machine
 * Author: Developer
 * Creation date: 2018. 10. 18.
 */
MACHINE
    machine

VARIABLES
 aa, bb
INVARIANT
 aa:1..10-->NAT &
 bb: 1..10-->NAT
INITIALISATION
 aa::1..10-->NAT ||
 bb:: 1..10-->NAT
OPERATIONS
 cc<--op=
 ANY ss WHERE
 ss:1..10-->BOOL&
 !ee.
(ee:1..10=>ss(ee)=bool(aa(ee)<bb(ee)))
 THEN
 cc:=ss
 END
END