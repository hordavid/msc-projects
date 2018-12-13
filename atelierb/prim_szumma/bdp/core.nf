Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(core))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(core))==(Machine(core));
  Level(Machine(core))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(core)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(core))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(core))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(core))==(?);
  List_Includes(Machine(core))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(core))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(core))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(core))==(?);
  Context_List_Variables(Machine(core))==(?);
  Abstract_List_Variables(Machine(core))==(?);
  Local_List_Variables(Machine(core))==(?);
  List_Variables(Machine(core))==(?);
  External_List_Variables(Machine(core))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(core))==(?);
  Abstract_List_VisibleVariables(Machine(core))==(?);
  External_List_VisibleVariables(Machine(core))==(?);
  Expanded_List_VisibleVariables(Machine(core))==(?);
  List_VisibleVariables(Machine(core))==(osszeg,darab,tomb);
  Internal_List_VisibleVariables(Machine(core))==(osszeg,darab,tomb)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(core))==(btrue);
  Gluing_List_Invariant(Machine(core))==(btrue);
  Expanded_List_Invariant(Machine(core))==(btrue);
  Abstract_List_Invariant(Machine(core))==(btrue);
  Context_List_Invariant(Machine(core))==(btrue);
  List_Invariant(Machine(core))==(tomb: 1..10 --> 1..100 & darab: 0..10 & osszeg: 0..1000)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(core))==(btrue);
  Abstract_List_Assertions(Machine(core))==(btrue);
  Context_List_Assertions(Machine(core))==(btrue);
  List_Assertions(Machine(core))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(core))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(core))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(core))==(darab,tomb,osszeg:=0,(1..10)*{1},0);
  Context_List_Initialisation(Machine(core))==(skip);
  List_Initialisation(Machine(core))==(darab:=0 || tomb:=(1..10)*{1} || osszeg:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(core))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(core))==(btrue);
  List_Constraints(Machine(core))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(core))==(beir,muvelet,kiir);
  List_Operations(Machine(core))==(beir,muvelet,kiir)
END
&
THEORY ListInputX IS
  List_Input(Machine(core),beir)==(?);
  List_Input(Machine(core),muvelet)==(?);
  List_Input(Machine(core),kiir)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(core),beir)==(?);
  List_Output(Machine(core),muvelet)==(?);
  List_Output(Machine(core),kiir)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(core),beir)==(beir);
  List_Header(Machine(core),muvelet)==(muvelet);
  List_Header(Machine(core),kiir)==(kiir)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(core),beir)==(btrue);
  List_Precondition(Machine(core),muvelet)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10);
  List_Precondition(Machine(core),kiir)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(core),kiir)==(btrue | skip);
  Expanded_List_Substitution(Machine(core),muvelet)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10 | @(db,ossz).(db: 0..10 & db = SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..10 & ossz: 0..1000 & ossz = SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..1000 ==> darab,osszeg:=db,ossz));
  Expanded_List_Substitution(Machine(core),beir)==(btrue | @elem.(elem: 1..10 --> 1..100 ==> tomb:=elem));
  List_Substitution(Machine(core),beir)==(ANY elem WHERE elem: 1..10 --> 1..100 THEN tomb:=elem END);
  List_Substitution(Machine(core),muvelet)==(ANY db,ossz WHERE db: 0..10 & db = SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..10 & ossz: 0..1000 & ossz = SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..1000 THEN darab:=db || osszeg:=ossz END);
  List_Substitution(Machine(core),kiir)==(skip)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(core))==(?);
  Inherited_List_Constants(Machine(core))==(?);
  List_Constants(Machine(core))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(core))==(?);
  Context_List_Defered(Machine(core))==(?);
  Context_List_Sets(Machine(core))==(?);
  List_Valuable_Sets(Machine(core))==(?);
  Inherited_List_Enumerated(Machine(core))==(?);
  Inherited_List_Defered(Machine(core))==(?);
  Inherited_List_Sets(Machine(core))==(?);
  List_Enumerated(Machine(core))==(?);
  List_Defered(Machine(core))==(?);
  List_Sets(Machine(core))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(core))==(?);
  Expanded_List_HiddenConstants(Machine(core))==(?);
  List_HiddenConstants(Machine(core))==(?);
  External_List_HiddenConstants(Machine(core))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(core))==(btrue);
  Context_List_Properties(Machine(core))==(btrue);
  Inherited_List_Properties(Machine(core))==(btrue);
  List_Properties(Machine(core))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(core),beir)==(Var(elem) == SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100)));
  List_ANY_Var(Machine(core),muvelet)==((Var(db) == btype(INTEGER,?,?)),(Var(ossz) == btype(INTEGER,?,?)));
  List_ANY_Var(Machine(core),kiir)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(core)) == (? | ? | ? | ? | beir,muvelet,kiir | ? | ? | ? | core);
  List_Of_HiddenCst_Ids(Machine(core)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(core)) == (?);
  List_Of_VisibleVar_Ids(Machine(core)) == (osszeg,darab,tomb | ?);
  List_Of_Ids_SeenBNU(Machine(core)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Machine(core)) == (Type(osszeg) == Mvv(btype(INTEGER,?,?));Type(darab) == Mvv(btype(INTEGER,?,?));Type(tomb) == Mvv(SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(core)) == (Type(kiir) == Cst(No_type,No_type);Type(muvelet) == Cst(No_type,No_type);Type(beir) == Cst(No_type,No_type));
  Observers(Machine(core)) == (Type(kiir) == Cst(No_type,No_type))
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
