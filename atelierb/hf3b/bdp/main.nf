Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(main))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(main))==(Machine(main));
  Level(Machine(main))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(main)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(main))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(main))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(main))==(?);
  List_Includes(Machine(main))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(main))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(main))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(main))==(?);
  Context_List_Variables(Machine(main))==(?);
  Abstract_List_Variables(Machine(main))==(?);
  Local_List_Variables(Machine(main))==(?);
  List_Variables(Machine(main))==(?);
  External_List_Variables(Machine(main))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(main))==(?);
  Abstract_List_VisibleVariables(Machine(main))==(?);
  External_List_VisibleVariables(Machine(main))==(?);
  Expanded_List_VisibleVariables(Machine(main))==(?);
  List_VisibleVariables(Machine(main))==(?);
  Internal_List_VisibleVariables(Machine(main))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(main))==(btrue);
  Gluing_List_Invariant(Machine(main))==(btrue);
  Expanded_List_Invariant(Machine(main))==(btrue);
  Abstract_List_Invariant(Machine(main))==(btrue);
  Context_List_Invariant(Machine(main))==(btrue);
  List_Invariant(Machine(main))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(main))==(btrue);
  Abstract_List_Assertions(Machine(main))==(btrue);
  Context_List_Assertions(Machine(main))==(btrue);
  List_Assertions(Machine(main))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(main))==(skip);
  Context_List_Initialisation(Machine(main))==(skip);
  List_Initialisation(Machine(main))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(main))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(main))==(btrue);
  List_Constraints(Machine(main))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(main))==(op);
  List_Operations(Machine(main))==(op)
END
&
THEORY ListInputX IS
  List_Input(Machine(main),op)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(main),op)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(main),op)==(op)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(main),op)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(main),op)==(btrue | skip);
  List_Substitution(Machine(main),op)==(skip)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(main))==(?);
  Inherited_List_Constants(Machine(main))==(?);
  List_Constants(Machine(main))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(main))==(?);
  Context_List_Defered(Machine(main))==(?);
  Context_List_Sets(Machine(main))==(?);
  List_Valuable_Sets(Machine(main))==(?);
  Inherited_List_Enumerated(Machine(main))==(?);
  Inherited_List_Defered(Machine(main))==(?);
  Inherited_List_Sets(Machine(main))==(?);
  List_Enumerated(Machine(main))==(?);
  List_Defered(Machine(main))==(?);
  List_Sets(Machine(main))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(main))==(?);
  Expanded_List_HiddenConstants(Machine(main))==(?);
  List_HiddenConstants(Machine(main))==(?);
  External_List_HiddenConstants(Machine(main))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(main))==(btrue);
  Context_List_Properties(Machine(main))==(btrue);
  Inherited_List_Properties(Machine(main))==(btrue);
  List_Properties(Machine(main))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(main),op)==(?);
  List_ANY_Var(Machine(main),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(main)) == (? | ? | ? | ? | op | ? | ? | ? | main);
  List_Of_HiddenCst_Ids(Machine(main)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(main)) == (?);
  List_Of_VisibleVar_Ids(Machine(main)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(main)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(main)) == (Type(op) == Cst(No_type,No_type));
  Observers(Machine(main)) == (Type(op) == Cst(No_type,No_type))
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
