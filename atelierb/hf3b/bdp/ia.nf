Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(ia))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(ia))==(Machine(ia));
  Level(Machine(ia))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(ia)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(ia))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(ia))==(iu)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(ia))==(?);
  List_Includes(Machine(ia))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(ia))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(ia))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(ia))==(tu);
  Context_List_Variables(Machine(ia))==(tu);
  Abstract_List_Variables(Machine(ia))==(?);
  Local_List_Variables(Machine(ia))==(ta,via1);
  List_Variables(Machine(ia))==(ta,via1);
  External_List_Variables(Machine(ia))==(ta,via1)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(ia))==(?);
  Abstract_List_VisibleVariables(Machine(ia))==(?);
  External_List_VisibleVariables(Machine(ia))==(?);
  Expanded_List_VisibleVariables(Machine(ia))==(?);
  List_VisibleVariables(Machine(ia))==(?);
  Internal_List_VisibleVariables(Machine(ia))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(ia))==(btrue);
  Gluing_List_Invariant(Machine(ia))==(btrue);
  Expanded_List_Invariant(Machine(ia))==(btrue);
  Abstract_List_Invariant(Machine(ia))==(btrue);
  Context_List_Invariant(Machine(ia))==(viu1: BOOL & tu: 1..5 --> INT);
  List_Invariant(Machine(ia))==(via1: BOOL & ta: 1..5 --> BOOL)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(ia))==(btrue);
  Abstract_List_Assertions(Machine(ia))==(btrue);
  Context_List_Assertions(Machine(ia))==(btrue);
  List_Assertions(Machine(ia))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(ia))==(via1:=FALSE || @(ta$0).(ta$0: 1..5 --> BOOL ==> ta:=ta$0));
  Context_List_Initialisation(Machine(ia))==(viu1,tu:=FALSE,(1..5)*{0});
  List_Initialisation(Machine(ia))==(via1:=FALSE || ta:: 1..5 --> BOOL)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(ia))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(ia),Machine(iu))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(ia))==(btrue);
  List_Constraints(Machine(ia))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(ia))==(inita,opa);
  List_Operations(Machine(ia))==(inita,opa)
END
&
THEORY ListInputX IS
  List_Input(Machine(ia),inita)==(?);
  List_Input(Machine(ia),opa)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(ia),inita)==(?);
  List_Output(Machine(ia),opa)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(ia),inita)==(inita);
  List_Header(Machine(ia),opa)==(opa)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(ia),inita)==(btrue);
  List_Precondition(Machine(ia),opa)==(via1 = FALSE & viu1 = TRUE)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(ia),opa)==(via1 = FALSE & viu1 = TRUE | @ss.(ss: 1..5 --> BOOL & !jj.(jj: 1..5 => ss(jj) = bool(tu(jj)>0)) ==> ta,via1:=ss,TRUE));
  Expanded_List_Substitution(Machine(ia),inita)==(btrue | via1:=FALSE);
  List_Substitution(Machine(ia),inita)==(via1:=FALSE);
  List_Substitution(Machine(ia),opa)==(ANY ss WHERE ss: 1..5 --> BOOL & !jj.(jj: 1..5 => ss(jj) = bool(tu(jj)>0)) THEN ta:=ss || via1:=TRUE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(ia))==(?);
  Inherited_List_Constants(Machine(ia))==(?);
  List_Constants(Machine(ia))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(ia))==(?);
  Context_List_Defered(Machine(ia))==(?);
  Context_List_Sets(Machine(ia))==(?);
  List_Valuable_Sets(Machine(ia))==(?);
  Inherited_List_Enumerated(Machine(ia))==(?);
  Inherited_List_Defered(Machine(ia))==(?);
  Inherited_List_Sets(Machine(ia))==(?);
  List_Enumerated(Machine(ia))==(?);
  List_Defered(Machine(ia))==(?);
  List_Sets(Machine(ia))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(ia))==(?);
  Expanded_List_HiddenConstants(Machine(ia))==(?);
  List_HiddenConstants(Machine(ia))==(?);
  External_List_HiddenConstants(Machine(ia))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(ia))==(btrue);
  Context_List_Properties(Machine(ia))==(btrue);
  Inherited_List_Properties(Machine(ia))==(btrue);
  List_Properties(Machine(ia))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(ia),inita)==(?);
  List_ANY_Var(Machine(ia),opa)==(Var(ss) == SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));
  List_ANY_Var(Machine(ia),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(ia)) == (? | ? | ta,via1 | ? | inita,opa | ? | used(Machine(iu)) | ? | ia);
  List_Of_HiddenCst_Ids(Machine(ia)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(ia)) == (?);
  List_Of_VisibleVar_Ids(Machine(ia)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(ia)) == (?: ?);
  List_Of_Ids(Machine(iu)) == (? | ? | tu | ? | initu,be | ? | ? | ? | iu);
  List_Of_HiddenCst_Ids(Machine(iu)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(iu)) == (?);
  List_Of_VisibleVar_Ids(Machine(iu)) == (viu1 | ?);
  List_Of_Ids_SeenBNU(Machine(iu)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(ia)) == (Type(ta) == Mvl(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(via1) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(ia)) == (Type(opa) == Cst(No_type,No_type);Type(inita) == Cst(No_type,No_type))
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
)
