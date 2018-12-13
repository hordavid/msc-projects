Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(keszletnyilv))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(keszletnyilv))==(Machine(keszletnyilv));
  Level(Machine(keszletnyilv))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(keszletnyilv)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(keszletnyilv))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(keszletnyilv))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(keszletnyilv))==(?);
  List_Includes(Machine(keszletnyilv))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(keszletnyilv))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(keszletnyilv))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(keszletnyilv))==(?);
  Context_List_Variables(Machine(keszletnyilv))==(?);
  Abstract_List_Variables(Machine(keszletnyilv))==(?);
  Local_List_Variables(Machine(keszletnyilv))==(fogyoban_keszlet,jelzes,slotok);
  List_Variables(Machine(keszletnyilv))==(fogyoban_keszlet,jelzes,slotok);
  External_List_Variables(Machine(keszletnyilv))==(fogyoban_keszlet,jelzes,slotok)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(keszletnyilv))==(?);
  Abstract_List_VisibleVariables(Machine(keszletnyilv))==(?);
  External_List_VisibleVariables(Machine(keszletnyilv))==(?);
  Expanded_List_VisibleVariables(Machine(keszletnyilv))==(?);
  List_VisibleVariables(Machine(keszletnyilv))==(?);
  Internal_List_VisibleVariables(Machine(keszletnyilv))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(keszletnyilv))==(btrue);
  Gluing_List_Invariant(Machine(keszletnyilv))==(btrue);
  Expanded_List_Invariant(Machine(keszletnyilv))==(btrue);
  Abstract_List_Invariant(Machine(keszletnyilv))==(btrue);
  Context_List_Invariant(Machine(keszletnyilv))==(btrue);
  List_Invariant(Machine(keszletnyilv))==(slotok: 1..100 --> 0..100*500 & fogyoban_keszlet: 1..100 --> 0..100*500 & !ii.(ii: 1..100 => fogyoban_keszlet(ii) = ii*500-slotok(ii)) & !ii.(ii: 1..100 => slotok(ii): 0..ii*500) & jelzes: BOOL & (jelzes = TRUE => #jj.(jj: 1..100 & slotok(jj)<jj*500/2)) & (jelzes = FALSE => !kk.(kk: 1..100 => slotok(kk)>=kk*500/2)))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(keszletnyilv))==(btrue);
  Abstract_List_Assertions(Machine(keszletnyilv))==(btrue);
  Context_List_Assertions(Machine(keszletnyilv))==(btrue);
  List_Assertions(Machine(keszletnyilv))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(keszletnyilv))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(keszletnyilv))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(keszletnyilv))==(slotok,fogyoban_keszlet,jelzes:=(1..100)*{0},%kk.(kk: 1..100 | kk*500),TRUE);
  Context_List_Initialisation(Machine(keszletnyilv))==(skip);
  List_Initialisation(Machine(keszletnyilv))==(slotok:=(1..100)*{0} || fogyoban_keszlet:=%kk.(kk: 1..100 | kk*500) || jelzes:=TRUE)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(keszletnyilv))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(keszletnyilv))==(btrue);
  List_Constraints(Machine(keszletnyilv))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(keszletnyilv))==(betesz,kivesz,fogyoban_keszlet_kiolvas);
  List_Operations(Machine(keszletnyilv))==(betesz,kivesz,fogyoban_keszlet_kiolvas)
END
&
THEORY ListInputX IS
  List_Input(Machine(keszletnyilv),betesz)==(slot,db);
  List_Input(Machine(keszletnyilv),kivesz)==(slot,db);
  List_Input(Machine(keszletnyilv),fogyoban_keszlet_kiolvas)==(slot)
END
&
THEORY ListOutputX IS
  List_Output(Machine(keszletnyilv),betesz)==(?);
  List_Output(Machine(keszletnyilv),kivesz)==(?);
  List_Output(Machine(keszletnyilv),fogyoban_keszlet_kiolvas)==(ret)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(keszletnyilv),betesz)==(betesz(slot,db));
  List_Header(Machine(keszletnyilv),kivesz)==(kivesz(slot,db));
  List_Header(Machine(keszletnyilv),fogyoban_keszlet_kiolvas)==(ret <-- fogyoban_keszlet_kiolvas(slot))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(keszletnyilv),betesz)==(slot: 1..100 & db: 1..100*500 & slotok(slot)+db: 0..slot*500 & fogyoban_keszlet(slot)-db: 0..100*500);
  List_Precondition(Machine(keszletnyilv),kivesz)==(slot: 1..100 & db: 1..100*500 & slotok(slot)-db: 0..slot*500 & fogyoban_keszlet(slot)+db: 0..100*500);
  List_Precondition(Machine(keszletnyilv),fogyoban_keszlet_kiolvas)==(slot: 1..100)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(keszletnyilv),fogyoban_keszlet_kiolvas)==(slot: 1..100 | ret:=fogyoban_keszlet(slot));
  Expanded_List_Substitution(Machine(keszletnyilv),kivesz)==(slot: 1..100 & db: 1..100*500 & slotok(slot)-db: 0..slot*500 & fogyoban_keszlet(slot)+db: 0..50000 | @(t_jelzes,t_ii,t_slotok,t_fogyoban_keszlet).(t_jelzes: BOOL & t_ii: 1..100 & t_slotok: 1..100 --> 0..50000 & t_fogyoban_keszlet: 1..100 --> 0..50000 & t_slotok = slotok<+{slot|->slotok(slot)-db} & t_fogyoban_keszlet = fogyoban_keszlet<+{slot|->fogyoban_keszlet(slot)+db} & (t_jelzes = TRUE => #jj.(jj: 1..100 & t_slotok(jj)<jj*500/2)) & (t_jelzes = FALSE => !kk.(kk: 1..100 => t_slotok(kk)>=kk*500/2)) & !ii.(ii: 1..100 => t_fogyoban_keszlet(ii) = ii*500-t_slotok(ii)) & !ii.(ii: 1..100 => t_slotok(ii): 0..ii*500) ==> slotok,fogyoban_keszlet,jelzes:=t_slotok,t_fogyoban_keszlet,t_jelzes));
  Expanded_List_Substitution(Machine(keszletnyilv),betesz)==(slot: 1..100 & db: 1..100*500 & slotok(slot)+db: 0..slot*500 & fogyoban_keszlet(slot)-db: 0..50000 | @(t_jelzes,t_ii,t_slotok,t_fogyoban_keszlet).(t_jelzes: BOOL & t_ii: 1..100 & t_slotok: 1..100 --> 0..50000 & t_fogyoban_keszlet: 1..100 --> 0..50000 & t_slotok = slotok<+{slot|->slotok(slot)+db} & t_fogyoban_keszlet = fogyoban_keszlet<+{slot|->fogyoban_keszlet(slot)-db} & (t_jelzes = TRUE => #jj.(jj: 1..100 & t_slotok(jj)<jj*500/2)) & (t_jelzes = FALSE => !kk.(kk: 1..100 => t_slotok(kk)>=kk*500/2)) & !ii.(ii: 1..100 => t_fogyoban_keszlet(ii) = ii*500-t_slotok(ii)) & !ii.(ii: 1..100 => t_slotok(ii): 0..ii*500) ==> slotok,fogyoban_keszlet,jelzes:=t_slotok,t_fogyoban_keszlet,t_jelzes));
  List_Substitution(Machine(keszletnyilv),betesz)==(ANY t_jelzes,t_ii,t_slotok,t_fogyoban_keszlet WHERE t_jelzes: BOOL & t_ii: 1..100 & t_slotok: 1..100 --> 0..100*500 & t_fogyoban_keszlet: 1..100 --> 0..100*500 & t_slotok = slotok<+{slot|->slotok(slot)+db} & t_fogyoban_keszlet = fogyoban_keszlet<+{slot|->fogyoban_keszlet(slot)-db} & (t_jelzes = TRUE => #jj.(jj: 1..100 & t_slotok(jj)<jj*500/2)) & (t_jelzes = FALSE => !kk.(kk: 1..100 => t_slotok(kk)>=kk*500/2)) & !ii.(ii: 1..100 => t_fogyoban_keszlet(ii) = ii*500-t_slotok(ii)) & !ii.(ii: 1..100 => t_slotok(ii): 0..ii*500) THEN slotok:=t_slotok || fogyoban_keszlet:=t_fogyoban_keszlet || jelzes:=t_jelzes END);
  List_Substitution(Machine(keszletnyilv),kivesz)==(ANY t_jelzes,t_ii,t_slotok,t_fogyoban_keszlet WHERE t_jelzes: BOOL & t_ii: 1..100 & t_slotok: 1..100 --> 0..100*500 & t_fogyoban_keszlet: 1..100 --> 0..100*500 & t_slotok = slotok<+{slot|->slotok(slot)-db} & t_fogyoban_keszlet = fogyoban_keszlet<+{slot|->fogyoban_keszlet(slot)+db} & (t_jelzes = TRUE => #jj.(jj: 1..100 & t_slotok(jj)<jj*500/2)) & (t_jelzes = FALSE => !kk.(kk: 1..100 => t_slotok(kk)>=kk*500/2)) & !ii.(ii: 1..100 => t_fogyoban_keszlet(ii) = ii*500-t_slotok(ii)) & !ii.(ii: 1..100 => t_slotok(ii): 0..ii*500) THEN slotok:=t_slotok || fogyoban_keszlet:=t_fogyoban_keszlet || jelzes:=t_jelzes END);
  List_Substitution(Machine(keszletnyilv),fogyoban_keszlet_kiolvas)==(ret:=fogyoban_keszlet(slot))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(keszletnyilv))==(?);
  Inherited_List_Constants(Machine(keszletnyilv))==(?);
  List_Constants(Machine(keszletnyilv))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(keszletnyilv))==(?);
  Context_List_Defered(Machine(keszletnyilv))==(?);
  Context_List_Sets(Machine(keszletnyilv))==(?);
  List_Valuable_Sets(Machine(keszletnyilv))==(?);
  Inherited_List_Enumerated(Machine(keszletnyilv))==(?);
  Inherited_List_Defered(Machine(keszletnyilv))==(?);
  Inherited_List_Sets(Machine(keszletnyilv))==(?);
  List_Enumerated(Machine(keszletnyilv))==(?);
  List_Defered(Machine(keszletnyilv))==(?);
  List_Sets(Machine(keszletnyilv))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(keszletnyilv))==(?);
  Expanded_List_HiddenConstants(Machine(keszletnyilv))==(?);
  List_HiddenConstants(Machine(keszletnyilv))==(?);
  External_List_HiddenConstants(Machine(keszletnyilv))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(keszletnyilv))==(btrue);
  Context_List_Properties(Machine(keszletnyilv))==(btrue);
  Inherited_List_Properties(Machine(keszletnyilv))==(btrue);
  List_Properties(Machine(keszletnyilv))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(keszletnyilv),betesz)==((Var(t_jelzes) == btype(BOOL,?,?)),(Var(t_ii) == btype(INTEGER,?,?)),(Var(t_slotok) == SetOf(btype(INTEGER,1,100)*btype(INTEGER,0,100*500))),(Var(t_fogyoban_keszlet) == SetOf(btype(INTEGER,1,100)*btype(INTEGER,0,100*500))));
  List_ANY_Var(Machine(keszletnyilv),kivesz)==((Var(t_jelzes) == btype(BOOL,?,?)),(Var(t_ii) == btype(INTEGER,?,?)),(Var(t_slotok) == SetOf(btype(INTEGER,1,100)*btype(INTEGER,0,100*500))),(Var(t_fogyoban_keszlet) == SetOf(btype(INTEGER,1,100)*btype(INTEGER,0,100*500))));
  List_ANY_Var(Machine(keszletnyilv),fogyoban_keszlet_kiolvas)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(keszletnyilv)) == (? | ? | fogyoban_keszlet,jelzes,slotok | ? | betesz,kivesz,fogyoban_keszlet_kiolvas | ? | ? | ? | keszletnyilv);
  List_Of_HiddenCst_Ids(Machine(keszletnyilv)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(keszletnyilv)) == (?);
  List_Of_VisibleVar_Ids(Machine(keszletnyilv)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(keszletnyilv)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(keszletnyilv)) == (Type(fogyoban_keszlet) == Mvl(SetOf(btype(INTEGER,1,100)*btype(INTEGER,0,50000)));Type(jelzes) == Mvl(btype(BOOL,?,?));Type(slotok) == Mvl(SetOf(btype(INTEGER,1,100)*btype(INTEGER,0,50000))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(keszletnyilv)) == (Type(fogyoban_keszlet_kiolvas) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(kivesz) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(betesz) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(keszletnyilv)) == (Type(fogyoban_keszlet_kiolvas) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)))
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
)
