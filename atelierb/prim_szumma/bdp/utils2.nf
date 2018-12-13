Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(utils2))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(utils2))==(Machine(utils2));
  Level(Machine(utils2))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(utils2)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(utils2))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(utils2))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(utils2))==(?);
  List_Includes(Machine(utils2))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(utils2))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(utils2))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(utils2))==(?);
  Context_List_Variables(Machine(utils2))==(?);
  Abstract_List_Variables(Machine(utils2))==(?);
  Local_List_Variables(Machine(utils2))==(?);
  List_Variables(Machine(utils2))==(?);
  External_List_Variables(Machine(utils2))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(utils2))==(?);
  Abstract_List_VisibleVariables(Machine(utils2))==(?);
  External_List_VisibleVariables(Machine(utils2))==(?);
  Expanded_List_VisibleVariables(Machine(utils2))==(?);
  List_VisibleVariables(Machine(utils2))==(?);
  Internal_List_VisibleVariables(Machine(utils2))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(utils2))==(btrue);
  Gluing_List_Invariant(Machine(utils2))==(btrue);
  Expanded_List_Invariant(Machine(utils2))==(btrue);
  Abstract_List_Invariant(Machine(utils2))==(btrue);
  Context_List_Invariant(Machine(utils2))==(btrue);
  List_Invariant(Machine(utils2))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(utils2))==(btrue);
  Abstract_List_Assertions(Machine(utils2))==(btrue);
  Context_List_Assertions(Machine(utils2))==(btrue);
  List_Assertions(Machine(utils2))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(utils2))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(utils2))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(utils2))==(skip);
  Context_List_Initialisation(Machine(utils2))==(skip);
  List_Initialisation(Machine(utils2))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(utils2))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(utils2))==(btrue);
  List_Constraints(Machine(utils2))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(utils2))==(prim_osszeg,prim_darab);
  List_Operations(Machine(utils2))==(prim_osszeg,prim_darab)
END
&
THEORY ListInputX IS
  List_Input(Machine(utils2),prim_osszeg)==(tomb);
  List_Input(Machine(utils2),prim_darab)==(tomb)
END
&
THEORY ListOutputX IS
  List_Output(Machine(utils2),prim_osszeg)==(ret);
  List_Output(Machine(utils2),prim_darab)==(ret)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(utils2),prim_osszeg)==(ret <-- prim_osszeg(tomb));
  List_Header(Machine(utils2),prim_darab)==(ret <-- prim_darab(tomb))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(utils2),prim_osszeg)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10);
  List_Precondition(Machine(utils2),prim_darab)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(utils2),prim_darab)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10 | @darab.(darab: 0..10 & darab = SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..10 ==> ret:=darab));
  Expanded_List_Substitution(Machine(utils2),prim_osszeg)==(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10 | @ss.(ss: 0..1000 & ss = SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..1000 ==> ret:=ss));
  List_Substitution(Machine(utils2),prim_osszeg)==(ANY ss WHERE ss: 0..1000 & ss = SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..1000 THEN ret:=ss END);
  List_Substitution(Machine(utils2),prim_darab)==(ANY darab WHERE darab: 0..10 & darab = SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..10 THEN ret:=darab END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(utils2))==(?);
  Inherited_List_Constants(Machine(utils2))==(?);
  List_Constants(Machine(utils2))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(utils2))==(?);
  Context_List_Defered(Machine(utils2))==(?);
  Context_List_Sets(Machine(utils2))==(?);
  List_Valuable_Sets(Machine(utils2))==(?);
  Inherited_List_Enumerated(Machine(utils2))==(?);
  Inherited_List_Defered(Machine(utils2))==(?);
  Inherited_List_Sets(Machine(utils2))==(?);
  List_Enumerated(Machine(utils2))==(?);
  List_Defered(Machine(utils2))==(?);
  List_Sets(Machine(utils2))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(utils2))==(?);
  Expanded_List_HiddenConstants(Machine(utils2))==(?);
  List_HiddenConstants(Machine(utils2))==(?);
  External_List_HiddenConstants(Machine(utils2))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(utils2))==(btrue);
  Context_List_Properties(Machine(utils2))==(btrue);
  Inherited_List_Properties(Machine(utils2))==(btrue);
  List_Properties(Machine(utils2))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(utils2),prim_osszeg)==(Var(ss) == btype(INTEGER,?,?));
  List_ANY_Var(Machine(utils2),prim_darab)==(Var(darab) == btype(INTEGER,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(utils2)) == (? | ? | ? | ? | prim_osszeg,prim_darab | ? | ? | ? | utils2);
  List_Of_HiddenCst_Ids(Machine(utils2)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(utils2)) == (?);
  List_Of_VisibleVar_Ids(Machine(utils2)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(utils2)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(utils2)) == (Type(prim_darab) == Cst(btype(INTEGER,?,?),SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100)));Type(prim_osszeg) == Cst(btype(INTEGER,?,?),SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100))));
  Observers(Machine(utils2)) == (Type(prim_darab) == Cst(btype(INTEGER,?,?),SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100)));Type(prim_osszeg) == Cst(btype(INTEGER,?,?),SetOf(btype(INTEGER,1,10)*btype(INTEGER,1,100))))
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
