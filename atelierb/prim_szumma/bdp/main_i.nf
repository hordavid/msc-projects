Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(main_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(main_i))==(Machine(main));
  Level(Implementation(main_i))==(1);
  Upper_Level(Implementation(main_i))==(Machine(main))
END
&
THEORY LoadedStructureX IS
  Implementation(main_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(main_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(main_i))==(BASIC_IO,core);
  Inherited_List_Includes(Implementation(main_i))==(core,BASIC_IO)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(main_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(main_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(main_i))==(?);
  Context_List_Variables(Implementation(main_i))==(?);
  Abstract_List_Variables(Implementation(main_i))==(?);
  Local_List_Variables(Implementation(main_i))==(?);
  List_Variables(Implementation(main_i))==(?);
  External_List_Variables(Implementation(main_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(main_i))==(?);
  Abstract_List_VisibleVariables(Implementation(main_i))==(?);
  External_List_VisibleVariables(Implementation(main_i))==(osszeg,darab,tomb);
  Expanded_List_VisibleVariables(Implementation(main_i))==(osszeg,darab,tomb);
  List_VisibleVariables(Implementation(main_i))==(?);
  Internal_List_VisibleVariables(Implementation(main_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(main_i))==(btrue);
  Abstract_List_Invariant(Implementation(main_i))==(btrue);
  Expanded_List_Invariant(Implementation(main_i))==(tomb: 1..10 --> 1..100 & darab: 0..10 & osszeg: 0..1000);
  Context_List_Invariant(Implementation(main_i))==(btrue);
  List_Invariant(Implementation(main_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(main_i))==(btrue);
  Expanded_List_Assertions(Implementation(main_i))==(btrue);
  Context_List_Assertions(Implementation(main_i))==(btrue);
  List_Assertions(Implementation(main_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(main_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(main_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(main_i))==(darab,tomb,osszeg:=0,(1..10)*{1},0);
  Context_List_Initialisation(Implementation(main_i))==(skip);
  List_Initialisation(Implementation(main_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(main_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(main_i),Machine(BASIC_IO))==(?);
  List_Instanciated_Parameters(Implementation(main_i),Machine(core))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(main_i),Machine(core))==(btrue);
  List_Constraints(Implementation(main_i))==(btrue);
  List_Context_Constraints(Implementation(main_i))==(btrue);
  List_Constraints(Implementation(main_i),Machine(BASIC_IO))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(main_i))==(main_op);
  List_Operations(Implementation(main_i))==(main_op)
END
&
THEORY ListInputX IS
  List_Input(Implementation(main_i),main_op)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(main_i),main_op)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(main_i),main_op)==(main_op)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(main_i),main_op)==(btrue);
  List_Precondition(Implementation(main_i),main_op)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(main_i),main_op)==(btrue | (btrue | @elem.(elem: 1..10 --> 1..100 ==> tomb:=elem));(tomb: 1..10 --> 1..100 & dom(tomb) = 1..10 | @(db,ossz).(db: 0..10 & db = SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->1,FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..10 & ossz: 0..1000 & ossz = SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))) & SIGMA(ii).(ii: 1..10 | {TRUE|->tomb(ii),FALSE|->0}(bool(2<=tomb(ii) & !zz.(zz: 2..tomb(ii)-1 => tomb(ii) mod zz/=0)))): 0..1000 ==> darab,osszeg:=db,ossz));(btrue | skip));
  List_Substitution(Implementation(main_i),main_op)==(beir;muvelet;kiir)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(main_i))==(?);
  Inherited_List_Constants(Implementation(main_i))==(?);
  List_Constants(Implementation(main_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(main_i))==(?);
  Context_List_Defered(Implementation(main_i))==(?);
  Context_List_Sets(Implementation(main_i))==(?);
  List_Own_Enumerated(Implementation(main_i))==(?);
  List_Valuable_Sets(Implementation(main_i))==(?);
  Inherited_List_Enumerated(Implementation(main_i))==(?);
  Inherited_List_Defered(Implementation(main_i))==(?);
  Inherited_List_Sets(Implementation(main_i))==(?);
  List_Enumerated(Implementation(main_i))==(?);
  List_Defered(Implementation(main_i))==(?);
  List_Sets(Implementation(main_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(main_i))==(?);
  Expanded_List_HiddenConstants(Implementation(main_i))==(?);
  List_HiddenConstants(Implementation(main_i))==(?);
  External_List_HiddenConstants(Implementation(main_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(main_i))==(btrue);
  Context_List_Properties(Implementation(main_i))==(btrue);
  Inherited_List_Properties(Implementation(main_i))==(btrue);
  List_Properties(Implementation(main_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(main_i))==(aa: aa);
  List_Values(Implementation(main_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(main_i),Machine(core))==(beir,muvelet,kiir);
  List_Included_Operations(Implementation(main_i),Machine(BASIC_IO))==(INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(main_i))==(Type(main_op) == Cst(No_type,No_type))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(main_i)) == (? | ? | ? | ? | main_op | ? | imported(Machine(BASIC_IO)),imported(Machine(core)) | ? | main_i);
  List_Of_HiddenCst_Ids(Implementation(main_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(main_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(main_i)) == (? | osszeg,darab,tomb);
  List_Of_Ids_SeenBNU(Implementation(main_i)) == (?: ?);
  List_Of_Ids(Machine(core)) == (? | ? | ? | ? | beir,muvelet,kiir | ? | ? | ? | core);
  List_Of_HiddenCst_Ids(Machine(core)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(core)) == (?);
  List_Of_VisibleVar_Ids(Machine(core)) == (osszeg,darab,tomb | ?);
  List_Of_Ids_SeenBNU(Machine(core)) == (?: ?);
  List_Of_Ids(Machine(BASIC_IO)) == (? | ? | ? | ? | INTERVAL_READ,INT_WRITE,BOOL_READ,BOOL_WRITE,CHAR_READ,CHAR_WRITE,STRING_WRITE | ? | ? | ? | BASIC_IO);
  List_Of_HiddenCst_Ids(Machine(BASIC_IO)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(BASIC_IO)) == (?);
  List_Of_VisibleVar_Ids(Machine(BASIC_IO)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(BASIC_IO)) == (?: ?)
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
  List_Local_Operations(Implementation(main_i))==(?)
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
  TypingPredicate(Implementation(main_i))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(main_i),Machine(BASIC_IO))==(?);
  ImportedVisVariablesList(Implementation(main_i),Machine(BASIC_IO))==(?);
  ImportedVariablesList(Implementation(main_i),Machine(core))==(?);
  ImportedVisVariablesList(Implementation(main_i),Machine(core))==(osszeg,darab,tomb)
END
&
THEORY ListLocalOpInvariantX END
)
