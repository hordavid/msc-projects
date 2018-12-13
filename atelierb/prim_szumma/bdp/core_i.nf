Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(core_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(core_i))==(Machine(core));
  Level(Implementation(core_i))==(1);
  Upper_Level(Implementation(core_i))==(Machine(core))
END
&
THEORY LoadedStructureX IS
  Implementation(core_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(core_i))==(BASIC_IO)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(core_i))==(utils2);
  Inherited_List_Includes(Implementation(core_i))==(utils2)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(core_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(core_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(core_i))==(?);
  Context_List_Variables(Implementation(core_i))==(?);
  Abstract_List_Variables(Implementation(core_i))==(?);
  Local_List_Variables(Implementation(core_i))==(?);
  List_Variables(Implementation(core_i))==(?);
  External_List_Variables(Implementation(core_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(core_i))==(osszeg,darab,tomb);
  Abstract_List_VisibleVariables(Implementation(core_i))==(osszeg,darab,tomb);
  External_List_VisibleVariables(Implementation(core_i))==(?);
  Expanded_List_VisibleVariables(Implementation(core_i))==(?);
  List_VisibleVariables(Implementation(core_i))==(?);
  Internal_List_VisibleVariables(Implementation(core_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(core_i))==(btrue);
  Abstract_List_Invariant(Implementation(core_i))==(tomb: 1..10 --> 1..100 & darab: 0..10 & osszeg: 0..1000);
  Expanded_List_Invariant(Implementation(core_i))==(btrue);
  Context_List_Invariant(Implementation(core_i))==(btrue);
  List_Invariant(Implementation(core_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(core_i))==(btrue);
  Expanded_List_Assertions(Implementation(core_i))==(btrue);
  Context_List_Assertions(Implementation(core_i))==(btrue);
  List_Assertions(Implementation(core_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(core_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(core_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(core_i))==(tomb:=(1..10)*{1};(0: INT | darab:=0);(0: INT | osszeg:=0));
  Context_List_Initialisation(Implementation(core_i))==(skip);
  List_Initialisation(Implementation(core_i))==(tomb:=(1..10)*{1};darab:=0;osszeg:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(core_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(core_i),Machine(utils2))==(?);
  List_Instanciated_Parameters(Implementation(core_i),Machine(BASIC_IO))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(core_i),Machine(utils2))==(btrue);
  List_Constraints(Implementation(core_i))==(btrue);
  List_Context_Constraints(Implementation(core_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(core_i))==(beir,muvelet,kiir);
  List_Operations(Implementation(core_i))==(beir,muvelet,kiir)
END
&
THEORY ListInputX IS
  List_Input(Implementation(core_i),beir)==(?);
  List_Input(Implementation(core_i),muvelet)==(?);
  List_Input(Implementation(core_i),kiir)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(core_i),beir)==(?);
  List_Output(Implementation(core_i),muvelet)==(?);
  List_Output(Implementation(core_i),kiir)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(core_i),beir)==(beir);
  List_Header(Implementation(core_i),muvelet)==(muvelet);
  List_Header(Implementation(core_i),kiir)==(kiir)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(core_i),beir)==(btrue);
  List_Precondition(Implementation(core_i),beir)==(btrue);
  Own_Precondition(Implementation(core_i),muvelet)==(btrue);
  List_Precondition(Implementation(core_i),muvelet)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10);
  Own_Precondition(Implementation(core_i),kiir)==(btrue);
  List_Precondition(Implementation(core_i),kiir)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(core_i),kiir)==(btrue | @(ii,elem).(("Megadott adatok: ": STRING | skip);elem:=0;ii:=1;WHILE ii<=10 DO (tomb(ii): INT & ii: dom(tomb) | elem:=tomb(ii));(1/=ii ==> (", ": STRING | skip) [] not(1/=ii) ==> skip);(ii: MININT..MAXINT | skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..11 & tomb: 1..10 --> 1..100 VARIANT 11-ii END;("\n\n": STRING | skip);(darab: MININT..MAXINT | skip);(" db prim szam van a tombben\n": STRING | skip);("Ezek osszege: ": STRING | skip);(osszeg: MININT..MAXINT | skip);("\n": STRING | skip)));
  Expanded_List_Substitution(Implementation(core_i),muvelet)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10 | (tomb: 1..10 --> 1..100 & dom(tomb) = 1..10 | @(darab$0).(darab$0: 0..10 & darab$0 = SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..10 ==> darab:=darab$0));(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10 | @ss.(ss: 0..1000 & ss = SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..1000 ==> osszeg:=ss)));
  Expanded_List_Substitution(Implementation(core_i),beir)==(btrue | @(ii,elem).(("Adjon meg ": STRING | skip);(Elemszam: MININT..MAXINT | skip);(" db. számot.\n": STRING | skip);elem:=0;ii:=1;WHILE ii<=10 DO (ii: MININT..MAXINT | skip);(": ": STRING | skip);(1: INT & 100: INT & 1<=100 | @(bb$0).(bb$0: 1..100 ==> elem:=bb$0));(ii: dom(tomb) & elem: INT | tomb:=tomb<+{ii|->elem});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..11 & tomb: 1..10 --> 1..100 VARIANT 11-ii END;("\n": STRING | skip)));
  List_Substitution(Implementation(core_i),beir)==(VAR ii,elem IN STRING_WRITE("Adjon meg ");INT_WRITE(Elemszam);STRING_WRITE(" db. számot.\n");elem:=0;ii:=1;WHILE ii<=10 DO INT_WRITE(ii);STRING_WRITE(": ");elem <-- INTERVAL_READ(1,100);tomb(ii):=elem;ii:=ii+1 INVARIANT ii: 1..11 & tomb: 1..10 --> 1..100 VARIANT 11-ii END;STRING_WRITE("\n") END);
  List_Substitution(Implementation(core_i),muvelet)==(darab <-- prim_darab(tomb);osszeg <-- prim_osszeg(tomb));
  List_Substitution(Implementation(core_i),kiir)==(VAR ii,elem IN STRING_WRITE("Megadott adatok: ");elem:=0;ii:=1;WHILE ii<=10 DO elem:=tomb(ii);IF 1/=ii THEN STRING_WRITE(", ") END;INT_WRITE(ii);ii:=ii+1 INVARIANT ii: 1..11 & tomb: 1..10 --> 1..100 VARIANT 11-ii END;STRING_WRITE("\n\n");INT_WRITE(darab);STRING_WRITE(" db prim szam van a tombben\n");STRING_WRITE("Ezek osszege: ");INT_WRITE(osszeg);STRING_WRITE("\n") END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(core_i))==(Elemszam);
  Inherited_List_Constants(Implementation(core_i))==(?);
  List_Constants(Implementation(core_i))==(Elemszam)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(core_i))==(?);
  Context_List_Defered(Implementation(core_i))==(?);
  Context_List_Sets(Implementation(core_i))==(?);
  List_Own_Enumerated(Implementation(core_i))==(?);
  List_Valuable_Sets(Implementation(core_i))==(?);
  Inherited_List_Enumerated(Implementation(core_i))==(?);
  Inherited_List_Defered(Implementation(core_i))==(?);
  Inherited_List_Sets(Implementation(core_i))==(?);
  List_Enumerated(Implementation(core_i))==(?);
  List_Defered(Implementation(core_i))==(?);
  List_Sets(Implementation(core_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(core_i))==(?);
  Expanded_List_HiddenConstants(Implementation(core_i))==(?);
  List_HiddenConstants(Implementation(core_i))==(?);
  External_List_HiddenConstants(Implementation(core_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(core_i))==(btrue);
  Context_List_Properties(Implementation(core_i))==(btrue);
  Inherited_List_Properties(Implementation(core_i))==(btrue);
  List_Properties(Implementation(core_i))==(Elemszam: INT & Elemszam = 10-0)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(core_i))==(10-0: INT & 10: INT & 0: INT);
  Values_Subs(Implementation(core_i))==(Elemszam: 10-0);
  List_Values(Implementation(core_i))==(Elemszam = 10-0)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Implementation(core_i),Machine(BASIC_IO))==(INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE);
  Seen_Context_List_Enumerated(Implementation(core_i))==(?);
  Seen_Context_List_Invariant(Implementation(core_i))==(btrue);
  Seen_Context_List_Assertions(Implementation(core_i))==(btrue);
  Seen_Context_List_Properties(Implementation(core_i))==(btrue);
  Seen_List_Constraints(Implementation(core_i))==(btrue);
  Seen_List_Precondition(Implementation(core_i),STRING_WRITE)==(ss: STRING);
  Seen_Expanded_List_Substitution(Implementation(core_i),STRING_WRITE)==(skip);
  Seen_List_Precondition(Implementation(core_i),CHAR_WRITE)==(cc: NAT);
  Seen_Expanded_List_Substitution(Implementation(core_i),CHAR_WRITE)==(skip);
  Seen_List_Precondition(Implementation(core_i),CHAR_READ)==(btrue);
  Seen_Expanded_List_Substitution(Implementation(core_i),CHAR_READ)==(@(cc$0).(cc$0: NAT ==> cc:=cc$0));
  Seen_List_Precondition(Implementation(core_i),BOOL_WRITE)==(bb: BOOL);
  Seen_Expanded_List_Substitution(Implementation(core_i),BOOL_WRITE)==(skip);
  Seen_List_Precondition(Implementation(core_i),BOOL_READ)==(btrue);
  Seen_Expanded_List_Substitution(Implementation(core_i),BOOL_READ)==(@(bb$0).(bb$0: BOOL ==> bb:=bb$0));
  Seen_List_Precondition(Implementation(core_i),INT_WRITE)==(ii: MININT..MAXINT);
  Seen_Expanded_List_Substitution(Implementation(core_i),INT_WRITE)==(skip);
  Seen_List_Precondition(Implementation(core_i),INTERVAL_READ)==(mm: INT & nn: INT & mm<=nn);
  Seen_Expanded_List_Substitution(Implementation(core_i),INTERVAL_READ)==(@(bb$0).(bb$0: mm..nn ==> bb:=bb$0));
  Seen_List_Operations(Implementation(core_i),Machine(BASIC_IO))==(INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE);
  Seen_Expanded_List_Invariant(Implementation(core_i),Machine(BASIC_IO))==(btrue)
END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(core_i),Machine(utils2))==(prim_osszeg,prim_darab);
  List_Included_Operations(Implementation(core_i),Machine(BASIC_IO))==(INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE)
END
&
THEORY InheritedEnvX IS
  Constants(Implementation(core_i))==(Type(Elemszam) == Cst(btype(INTEGER,?,?)));
  Operations(Implementation(core_i))==(Type(kiir) == Cst(No_type,No_type);Type(muvelet) == Cst(No_type,No_type);Type(beir) == Cst(No_type,No_type));
  VisibleVariables(Implementation(core_i))==(Type(osszeg) == Mvv(btype(INTEGER,?,?));Type(darab) == Mvv(btype(INTEGER,?,?));Type(tomb) == Mvv(SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100))))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(core_i)) == (Elemszam | ? | ? | ? | beir,muvelet,kiir | ? | seen(Machine(BASIC_IO)),imported(Machine(utils2)) | ? | core_i);
  List_Of_HiddenCst_Ids(Implementation(core_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(core_i)) == (Elemszam);
  List_Of_VisibleVar_Ids(Implementation(core_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(core_i)) == (?: ?);
  List_Of_Ids(Machine(utils2)) == (? | ? | ? | ? | prim_osszeg,prim_darab | ? | ? | ? | utils2);
  List_Of_HiddenCst_Ids(Machine(utils2)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(utils2)) == (?);
  List_Of_VisibleVar_Ids(Machine(utils2)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(utils2)) == (?: ?);
  List_Of_Ids(Machine(BASIC_IO)) == (? | ? | ? | ? | INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE | ? | ? | ? | BASIC_IO);
  List_Of_HiddenCst_Ids(Machine(BASIC_IO)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(BASIC_IO)) == (?);
  List_Of_VisibleVar_Ids(Machine(BASIC_IO)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(BASIC_IO)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(core_i)) == (Type(Elemszam) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(core_i)) == (Type(tomb) == Mvv(SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100)));Type(darab) == Mvv(btype(INTEGER,?,?));Type(osszeg) == Mvv(btype(INTEGER,?,?)))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(core_i),beir, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(elem) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(core_i),kiir, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(elem) == Lvl(btype(INTEGER,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(core_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(core_i))==(osszeg: INTEGER & darab: INTEGER & tomb: POW(INTEGER*INTEGER))
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(core_i),Machine(utils2))==(?);
  ImportedVisVariablesList(Implementation(core_i),Machine(utils2))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
