Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(ma_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(ma_i))==(Machine(ma));
  Level(Implementation(ma_i))==(1);
  Upper_Level(Implementation(ma_i))==(Machine(ma))
END
&
THEORY LoadedStructureX IS
  Implementation(ma_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(ma_i))==(BASIC_IO)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(ma_i))==(?);
  Inherited_List_Includes(Implementation(ma_i))==(ia,ib,iu)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(ma_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(ma_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(ma_i))==(?);
  Context_List_Variables(Implementation(ma_i))==(?);
  Abstract_List_Variables(Implementation(ma_i))==(tm,vm,ta,via1,tb,vib1,tu);
  Local_List_Variables(Implementation(ma_i))==(?);
  List_Variables(Implementation(ma_i))==(?);
  External_List_Variables(Implementation(ma_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(ma_i))==(viu1);
  Abstract_List_VisibleVariables(Implementation(ma_i))==(viu1);
  External_List_VisibleVariables(Implementation(ma_i))==(?);
  Expanded_List_VisibleVariables(Implementation(ma_i))==(?);
  List_VisibleVariables(Implementation(ma_i))==(vm,tuc,tmc,tbc,tac,vib1c,via1c);
  Internal_List_VisibleVariables(Implementation(ma_i))==(vm,tuc,tmc,tbc,tac,vib1c,via1c)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(ma_i))==(btrue);
  Expanded_List_Invariant(Implementation(ma_i))==(btrue);
  Abstract_List_Invariant(Implementation(ma_i))==(vm: BOOL & tm: 1..5 --> BOOL & via1: BOOL & ta: 1..5 --> BOOL & vib1: BOOL & tb: 1..5 --> BOOL & viu1: BOOL & tu: 1..5 --> INT);
  Context_List_Invariant(Implementation(ma_i))==(btrue);
  List_Invariant(Implementation(ma_i))==(via1c: BOOL & via1c = via1 & vib1c: BOOL & vib1c = vib1 & tac: 1..5 --> BOOL & tac = ta & tbc: 1..5 --> BOOL & tbc = tb & tmc: 1..5 --> BOOL & tmc = tm & tuc: 1..5 --> INT & tuc = tu)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(ma_i))==(btrue);
  Abstract_List_Assertions(Implementation(ma_i))==(btrue);
  Context_List_Assertions(Implementation(ma_i))==(btrue);
  List_Assertions(Implementation(ma_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(ma_i))==(via1c:=FALSE;vib1c:=FALSE;tac:=(1..5)*{FALSE};tbc:=(1..5)*{FALSE};tmc:=(1..5)*{FALSE};vm:=FALSE;viu1:=FALSE;tuc:=(1..5)*{0});
  Context_List_Initialisation(Implementation(ma_i))==(skip);
  List_Initialisation(Implementation(ma_i))==(via1c:=FALSE;vib1c:=FALSE;tac:=(1..5)*{FALSE};tbc:=(1..5)*{FALSE};tmc:=(1..5)*{FALSE};vm:=FALSE;viu1:=FALSE;tuc:=(1..5)*{0})
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(ma_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(ma_i),Machine(BASIC_IO))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(ma_i))==(btrue);
  List_Context_Constraints(Implementation(ma_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(ma_i))==(init,mbe,mtrb,mtra,opm,ki);
  List_Operations(Implementation(ma_i))==(init,mbe,mtrb,mtra,opm,ki)
END
&
THEORY ListInputX IS
  List_Input(Implementation(ma_i),init)==(?);
  List_Input(Implementation(ma_i),mbe)==(?);
  List_Input(Implementation(ma_i),mtrb)==(?);
  List_Input(Implementation(ma_i),mtra)==(?);
  List_Input(Implementation(ma_i),opm)==(?);
  List_Input(Implementation(ma_i),ki)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(ma_i),init)==(?);
  List_Output(Implementation(ma_i),mbe)==(?);
  List_Output(Implementation(ma_i),mtrb)==(?);
  List_Output(Implementation(ma_i),mtra)==(?);
  List_Output(Implementation(ma_i),opm)==(?);
  List_Output(Implementation(ma_i),ki)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(ma_i),init)==(init);
  List_Header(Implementation(ma_i),mbe)==(mbe);
  List_Header(Implementation(ma_i),mtrb)==(mtrb);
  List_Header(Implementation(ma_i),mtra)==(mtra);
  List_Header(Implementation(ma_i),opm)==(opm);
  List_Header(Implementation(ma_i),ki)==(ki)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(ma_i),init)==(btrue);
  List_Precondition(Implementation(ma_i),init)==(btrue);
  Own_Precondition(Implementation(ma_i),mbe)==(btrue);
  List_Precondition(Implementation(ma_i),mbe)==(vm = FALSE & viu1 = FALSE);
  Own_Precondition(Implementation(ma_i),mtrb)==(btrue);
  List_Precondition(Implementation(ma_i),mtrb)==(vm = FALSE & viu1 = TRUE & vib1 = FALSE);
  Own_Precondition(Implementation(ma_i),mtra)==(btrue);
  List_Precondition(Implementation(ma_i),mtra)==(vm = FALSE & viu1 = TRUE & via1 = FALSE);
  Own_Precondition(Implementation(ma_i),opm)==(btrue);
  List_Precondition(Implementation(ma_i),opm)==(vm = FALSE & viu1 = TRUE & via1 = TRUE & vib1 = TRUE);
  Own_Precondition(Implementation(ma_i),ki)==(btrue);
  List_Precondition(Implementation(ma_i),ki)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(ma_i),ki)==(btrue | (vm: BOOL | skip);(" ": STRING | skip);(via1c: BOOL | skip);(" ": STRING | skip);(vib1c: BOOL | skip);(" ": STRING | skip);(viu1: BOOL | skip);(" ": STRING | skip);("\n": STRING | skip));
  Expanded_List_Substitution(Implementation(ma_i),opm)==(vm = FALSE & viu1 = TRUE & via1 = TRUE & vib1 = TRUE | @(ii,dd,cc).(ii:=1;WHILE ii<=5 DO (ii: dom(tac) | dd:=tac(ii));(ii: dom(tbc) | cc:=tbc(ii));(dd/=TRUE & cc/=TRUE ==> (ii: dom(tmc) | tmc:=tmc<+{ii|->TRUE}) [] not(dd/=TRUE & cc/=TRUE) ==> (ii: dom(tmc) | tmc:=tmc<+{ii|->FALSE}));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..6 & tac: 1..5 --> BOOL & tbc: 1..5 --> BOOL & tmc: 1..5 --> BOOL & !jj.(jj: 1..ii-1 => tmc(jj) = bool(ta(jj)/=TRUE & tb(jj)/=TRUE)) VARIANT 6-ii END);vm:=TRUE);
  Expanded_List_Substitution(Implementation(ma_i),mtra)==(vm = FALSE & viu1 = TRUE & via1 = FALSE | @(ii,dd).(ii:=1;WHILE ii<=5 DO (ii: dom(tuc) | dd:=tuc(ii));(dd>0 ==> (ii: dom(tac) | tac:=tac<+{ii|->TRUE}) [] not(dd>0) ==> (ii: dom(tac) | tac:=tac<+{ii|->FALSE}));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..6 & tuc: 1..5 --> INT & tac: 1..5 --> BOOL & !jj.(jj: 1..ii-1 => tac(jj) = bool(tuc(jj)>0)) VARIANT 6-ii END;via1c:=TRUE));
  Expanded_List_Substitution(Implementation(ma_i),mtrb)==(vm = FALSE & viu1 = TRUE & vib1 = FALSE | @(ii,dd).(ii:=1;WHILE ii<=5 DO (ii: dom(tuc) | dd:=tuc(ii));(dd<0 ==> (ii: dom(tbc) | tbc:=tbc<+{ii|->TRUE}) [] not(dd<0) ==> (ii: dom(tbc) | tbc:=tbc<+{ii|->FALSE}));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..6 & tuc: 1..5 --> INT & tbc: 1..5 --> BOOL & !jj.(jj: 1..ii-1 => tbc(jj) = bool(tuc(jj)<0)) VARIANT 6-ii END;vib1c:=TRUE));
  Expanded_List_Substitution(Implementation(ma_i),mbe)==(vm = FALSE & viu1 = FALSE | @(ii,tt).(ii:=1;tt:=0;WHILE ii<=5 DO (MININT: INT & MAXINT: INT & MININT<=MAXINT | @(bb$0).(bb$0: MININT..MAXINT ==> tt:=bb$0));(ii: dom(tuc) & tt: INT | tuc:=tuc<+{ii|->tt});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..6 & tuc: 1..5 --> INT & !jj.(jj: 1..ii-1 => jj: 1..5) VARIANT 6-ii END;viu1:=TRUE));
  Expanded_List_Substitution(Implementation(ma_i),init)==(btrue | viu1:=FALSE;via1c:=FALSE;vib1c:=FALSE;vm:=FALSE);
  List_Substitution(Implementation(ma_i),init)==(viu1:=FALSE;via1c:=FALSE;vib1c:=FALSE;vm:=FALSE);
  List_Substitution(Implementation(ma_i),mbe)==(VAR ii,tt IN ii:=1;tt:=0;WHILE ii<=5 DO tt <-- INTERVAL_READ(MININT,MAXINT);tuc(ii):=tt;ii:=ii+1 INVARIANT ii: 1..6 & tuc: 1..5 --> INT & !jj.(jj: 1..ii-1 => jj: 1..5) VARIANT 6-ii END;viu1:=TRUE END);
  List_Substitution(Implementation(ma_i),mtrb)==(VAR ii,dd IN ii:=1;WHILE ii<=5 DO dd:=tuc(ii);IF dd<0 THEN tbc(ii):=TRUE ELSE tbc(ii):=FALSE END;ii:=ii+1 INVARIANT ii: 1..6 & tuc: 1..5 --> INT & tbc: 1..5 --> BOOL & !jj.(jj: 1..ii-1 => tbc(jj) = bool(tuc(jj)<0)) VARIANT 6-ii END;vib1c:=TRUE END);
  List_Substitution(Implementation(ma_i),mtra)==(VAR ii,dd IN ii:=1;WHILE ii<=5 DO dd:=tuc(ii);IF dd>0 THEN tac(ii):=TRUE ELSE tac(ii):=FALSE END;ii:=ii+1 INVARIANT ii: 1..6 & tuc: 1..5 --> INT & tac: 1..5 --> BOOL & !jj.(jj: 1..ii-1 => tac(jj) = bool(tuc(jj)>0)) VARIANT 6-ii END;via1c:=TRUE END);
  List_Substitution(Implementation(ma_i),opm)==(VAR ii,dd,cc IN ii:=1;WHILE ii<=5 DO dd:=tac(ii);cc:=tbc(ii);IF dd/=TRUE & cc/=TRUE THEN tmc(ii):=TRUE ELSE tmc(ii):=FALSE END;ii:=ii+1 INVARIANT ii: 1..6 & tac: 1..5 --> BOOL & tbc: 1..5 --> BOOL & tmc: 1..5 --> BOOL & !jj.(jj: 1..ii-1 => tmc(jj) = bool(ta(jj)/=TRUE & tb(jj)/=TRUE)) VARIANT 6-ii END END;vm:=TRUE);
  List_Substitution(Implementation(ma_i),ki)==(BOOL_WRITE(vm);STRING_WRITE(" ");BOOL_WRITE(via1c);STRING_WRITE(" ");BOOL_WRITE(vib1c);STRING_WRITE(" ");BOOL_WRITE(viu1);STRING_WRITE(" ");STRING_WRITE("\n"))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(ma_i))==(?);
  Inherited_List_Constants(Implementation(ma_i))==(?);
  List_Constants(Implementation(ma_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(ma_i))==(?);
  Context_List_Defered(Implementation(ma_i))==(?);
  Context_List_Sets(Implementation(ma_i))==(?);
  List_Own_Enumerated(Implementation(ma_i))==(?);
  List_Valuable_Sets(Implementation(ma_i))==(?);
  Inherited_List_Enumerated(Implementation(ma_i))==(?);
  Inherited_List_Defered(Implementation(ma_i))==(?);
  Inherited_List_Sets(Implementation(ma_i))==(?);
  List_Enumerated(Implementation(ma_i))==(?);
  List_Defered(Implementation(ma_i))==(?);
  List_Sets(Implementation(ma_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(ma_i))==(?);
  Expanded_List_HiddenConstants(Implementation(ma_i))==(?);
  List_HiddenConstants(Implementation(ma_i))==(?);
  External_List_HiddenConstants(Implementation(ma_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(ma_i))==(btrue);
  Context_List_Properties(Implementation(ma_i))==(btrue);
  Inherited_List_Properties(Implementation(ma_i))==(btrue);
  List_Properties(Implementation(ma_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(ma_i))==(aa: aa);
  List_Values(Implementation(ma_i))==(?)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Implementation(ma_i),Machine(BASIC_IO))==(INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE);
  Seen_Context_List_Enumerated(Implementation(ma_i))==(?);
  Seen_Context_List_Invariant(Implementation(ma_i))==(btrue);
  Seen_Context_List_Assertions(Implementation(ma_i))==(btrue);
  Seen_Context_List_Properties(Implementation(ma_i))==(btrue);
  Seen_List_Constraints(Implementation(ma_i))==(btrue);
  Seen_List_Precondition(Implementation(ma_i),STRING_WRITE)==(ss: STRING);
  Seen_Expanded_List_Substitution(Implementation(ma_i),STRING_WRITE)==(skip);
  Seen_List_Precondition(Implementation(ma_i),CHAR_WRITE)==(cc: NAT);
  Seen_Expanded_List_Substitution(Implementation(ma_i),CHAR_WRITE)==(skip);
  Seen_List_Precondition(Implementation(ma_i),CHAR_READ)==(btrue);
  Seen_Expanded_List_Substitution(Implementation(ma_i),CHAR_READ)==(@(cc$0).(cc$0: NAT ==> cc:=cc$0));
  Seen_List_Precondition(Implementation(ma_i),BOOL_WRITE)==(bb: BOOL);
  Seen_Expanded_List_Substitution(Implementation(ma_i),BOOL_WRITE)==(skip);
  Seen_List_Precondition(Implementation(ma_i),BOOL_READ)==(btrue);
  Seen_Expanded_List_Substitution(Implementation(ma_i),BOOL_READ)==(@(bb$0).(bb$0: BOOL ==> bb:=bb$0));
  Seen_List_Precondition(Implementation(ma_i),INT_WRITE)==(ii: MININT..MAXINT);
  Seen_Expanded_List_Substitution(Implementation(ma_i),INT_WRITE)==(skip);
  Seen_List_Precondition(Implementation(ma_i),INTERVAL_READ)==(mm: INT & nn: INT & mm<=nn);
  Seen_Expanded_List_Substitution(Implementation(ma_i),INTERVAL_READ)==(@(bb$0).(bb$0: mm..nn ==> bb:=bb$0));
  Seen_List_Operations(Implementation(ma_i),Machine(BASIC_IO))==(INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE);
  Seen_Expanded_List_Invariant(Implementation(ma_i),Machine(BASIC_IO))==(btrue)
END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(ma_i),Machine(BASIC_IO))==(INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(ma_i))==(Type(ki) == Cst(No_type,No_type);Type(opm) == Cst(No_type,No_type);Type(mtrb) == Cst(No_type,No_type);Type(mtra) == Cst(No_type,No_type);Type(mbe) == Cst(No_type,No_type);Type(init) == Cst(No_type,No_type));
  VisibleVariables(Implementation(ma_i))==(Type(viu1) == Mvv(btype(BOOL,?,?));Type(via1c) == Mvv(btype(BOOL,?,?));Type(vib1c) == Mvv(btype(BOOL,?,?));Type(tac) == Mvv(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(tbc) == Mvv(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(tmc) == Mvv(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(tuc) == Mvv(SetOf(btype(INTEGER,1,5)*btype(INTEGER,MININT,MAXINT)));Type(vm) == Mvv(btype(BOOL,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(ma_i)) == (? | ? | ? | ? | init,mbe,mtrb,mtra,opm,ki | ? | seen(Machine(BASIC_IO)) | ? | ma_i);
  List_Of_HiddenCst_Ids(Implementation(ma_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(ma_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(ma_i)) == (vm,tuc,tmc,tbc,tac,vib1c,via1c | ?);
  List_Of_Ids_SeenBNU(Implementation(ma_i)) == (?: ?);
  List_Of_Ids(Machine(BASIC_IO)) == (? | ? | ? | ? | INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE | ? | ? | ? | BASIC_IO);
  List_Of_HiddenCst_Ids(Machine(BASIC_IO)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(BASIC_IO)) == (?);
  List_Of_VisibleVar_Ids(Machine(BASIC_IO)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(BASIC_IO)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(ma_i)) == (Type(vm) == Mvv(btype(BOOL,?,?));Type(tuc) == Mvv(SetOf(btype(INTEGER,1,5)*btype(INTEGER,MININT,MAXINT)));Type(tmc) == Mvv(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(tbc) == Mvv(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(tac) == Mvv(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(vib1c) == Mvv(btype(BOOL,?,?));Type(via1c) == Mvv(btype(BOOL,?,?));Type(viu1) == Mvv(btype(BOOL,?,?)))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(ma_i),mbe, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(tt) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(ma_i),mtrb, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(dd) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(ma_i),mtra, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(dd) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(ma_i),opm, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(dd) == Lvl(btype(BOOL,?,?));Type(cc) == Lvl(btype(BOOL,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  event_b_project == KO;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO
END
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(ma_i))==(?)
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
  TypingPredicate(Implementation(ma_i))==(viu1: BOOL & via1c: BOOL & vib1c: BOOL & tac: POW(INTEGER*BOOL) & tbc: POW(INTEGER*BOOL) & tmc: POW(INTEGER*BOOL) & tuc: POW(INTEGER*INTEGER) & vm: BOOL)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
