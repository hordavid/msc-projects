Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(ib))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(ib))==(Machine(ib));
  Level(Machine(ib))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(ib)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(ib))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(ib))==(iu)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(ib))==(?);
  List_Includes(Machine(ib))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(ib))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(ib))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(ib))==(tu);
  Context_List_Variables(Machine(ib))==(tu);
  Abstract_List_Variables(Machine(ib))==(?);
  Local_List_Variables(Machine(ib))==(tb,vib1);
  List_Variables(Machine(ib))==(tb,vib1);
  External_List_Variables(Machine(ib))==(tb,vib1)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(ib))==(?);
  Abstract_List_VisibleVariables(Machine(ib))==(?);
  External_List_VisibleVariables(Machine(ib))==(?);
  Expanded_List_VisibleVariables(Machine(ib))==(?);
  List_VisibleVariables(Machine(ib))==(?);
  Internal_List_VisibleVariables(Machine(ib))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(ib))==(btrue);
  Gluing_List_Invariant(Machine(ib))==(btrue);
  Expanded_List_Invariant(Machine(ib))==(btrue);
  Abstract_List_Invariant(Machine(ib))==(btrue);
  Context_List_Invariant(Machine(ib))==(viu1: BOOL & tu: 1..5 --> INT);
  List_Invariant(Machine(ib))==(vib1: BOOL & tb: 1..5 --> BOOL)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(ib))==(btrue);
  Abstract_List_Assertions(Machine(ib))==(btrue);
  Context_List_Assertions(Machine(ib))==(btrue);
  List_Assertions(Machine(ib))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(ib))==(vib1:=FALSE || @(tb$0).(tb$0: 1..5 --> BOOL ==> tb:=tb$0));
  Context_List_Initialisation(Machine(ib))==(viu1,tu:=FALSE,(1..5)*{0});
  List_Initialisation(Machine(ib))==(vib1:=FALSE || tb:: 1..5 --> BOOL)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(ib))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(ib),Machine(iu))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(ib))==(btrue);
  List_Constraints(Machine(ib))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(ib))==(initb,opb);
  List_Operations(Machine(ib))==(initb,opb)
END
&
THEORY ListInputX IS
  List_Input(Machine(ib),initb)==(?);
  List_Input(Machine(ib),opb)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(ib),initb)==(?);
  List_Output(Machine(ib),opb)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(ib),initb)==(initb);
  List_Header(Machine(ib),opb)==(opb)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(ib),initb)==(btrue);
  List_Precondition(Machine(ib),opb)==(vib1 = FALSE & viu1 = TRUE)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(ib),opb)==(vib1 = FALSE & viu1 = TRUE | @ss.(ss: 1..5 --> BOOL & !jj.(jj: 1..5 => ss(jj) = bool(tu(jj)<0)) ==> tb,vib1:=ss,TRUE));
  Expanded_List_Substitution(Machine(ib),initb)==(btrue | vib1:=FALSE);
  List_Substitution(Machine(ib),initb)==(vib1:=FALSE);
  List_Substitution(Machine(ib),opb)==(ANY ss WHERE ss: 1..5 --> BOOL & !jj.(jj: 1..5 => ss(jj) = bool(tu(jj)<0)) THEN tb:=ss || vib1:=TRUE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(ib))==(?);
  Inherited_List_Constants(Machine(ib))==(?);
  List_Constants(Machine(ib))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(ib))==(?);
  Context_List_Defered(Machine(ib))==(?);
  Context_List_Sets(Machine(ib))==(?);
  List_Valuable_Sets(Machine(ib))==(?);
  Inherited_List_Enumerated(Machine(ib))==(?);
  Inherited_List_Defered(Machine(ib))==(?);
  Inherited_List_Sets(Machine(ib))==(?);
  List_Enumerated(Machine(ib))==(?);
  List_Defered(Machine(ib))==(?);
  List_Sets(Machine(ib))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(ib))==(?);
  Expanded_List_HiddenConstants(Machine(ib))==(?);
  List_HiddenConstants(Machine(ib))==(?);
  External_List_HiddenConstants(Machine(ib))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(ib))==(btrue);
  Context_List_Properties(Machine(ib))==(btrue);
  Inherited_List_Properties(Machine(ib))==(btrue);
  List_Properties(Machine(ib))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(ib),initb)==(?);
  List_ANY_Var(Machine(ib),opb)==(Var(ss) == SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));
  List_ANY_Var(Machine(ib),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(ib)) == (? | ? | tb,vib1 | ? | initb,opb | ? | used(Machine(iu)) | ? | ib);
  List_Of_HiddenCst_Ids(Machine(ib)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(ib)) == (?);
  List_Of_VisibleVar_Ids(Machine(ib)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(ib)) == (?: ?);
  List_Of_Ids(Machine(iu)) == (? | ? | tu | ? | initu,be | ? | ? | ? | iu);
  List_Of_HiddenCst_Ids(Machine(iu)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(iu)) == (?);
  List_Of_VisibleVar_Ids(Machine(iu)) == (viu1 | ?);
  List_Of_Ids_SeenBNU(Machine(iu)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(ib)) == (Type(tb) == Mvl(SetOf(btype(INTEGER,1,5)*btype(BOOL,0,1)));Type(vib1) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(ib)) == (Type(opb) == Cst(No_type,No_type);Type(initb) == Cst(No_type,No_type))
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
