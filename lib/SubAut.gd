#############################################################################
##
##
#W  SubAut.gd					      	Michael Albert,
#W                                      Steve Linton,
#W                                      Ruth Hoffmann
##
##
#Y  Copyright (C) 2004-2017 School of Computer Science,
#Y                          University of St. Andrews, North Haugh,
#Y                          St. Andrews, Fife KY16 9SS, Scotland
##

#############################################################################
##
#F  SubPermAut(perm)
##
##  Returns an automaton accepting all encoded subpermutations of perm.
##
DeclareGlobalFunction( "SubPermAut" );

#############################################################################
##
#F  knSuperPermAutomaton(perm,int,int)
##
##  Returns an automaton accepting all encoded superpermutations involving perm
##  up to rank k and length n.
##
DeclareGlobalFunction( "knSuperPermAutomaton" );

#############################################################################
##
#F  InbetweenPermAutomaton(perm,perm)
##
##  Returns an automaton accepting all encoded rpermutations between the
##  two parameters.
##
DeclareGlobalFunction( "InbetweenPermAutomaton" );