#############################################################################
##
##
#W  SubAut.gi						Michael Albert,
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
##  Returns an automaton containing all subpermutations of perm.
##
InstallGlobalFunction(SubPermAut, function(p)
local penc,paut,maxrank,h,revpaut,subaut,wordlist,i,resaut;

penc := RankEncoding(p);

maxrank := Maximum(penc);

penc := SequencesToRatExp([penc]);
paut := RatExpToAut(penc);

h := InvolvementTransducer(maxrank);

revpaut := MinimalAutomaton(ReversedAutomaton(paut));

subaut := MinimalAutomaton(CombineAutTransducer(revpaut,h));

wordlist := [];

for i in [1..Length(p)] do
    Append(wordlist,AcceptedWordsReversed(subaut,i));
od;

resaut := SequencesToRatExp(wordlist);

return MinimalAutomaton(RatExpToAut(resaut));

end);

#############################################################################
##
#F  knSuperPermAutomaton(perm,int,int)
##
##  Returns an automaton accepting all encoded superpermutations involving perm
##  up to rank k and length n.
##
InstallGlobalFunction(knSuperPermAutomaton, function(p,k,n) #n is max length
    local penc,paut,h,revpaut,subaut,wordlist,i,resaut;

    penc := RankEncoding(p);
    penc := SequencesToRatExp([penc]);
    paut := RatExpToAut(penc);

    h := TransposedTransducer(InvolvementTransducer(k));

    revpaut := MinimalAutomaton(ReversedAutomaton(paut));

    subaut := MinimalAutomaton(CombineAutTransducer(revpaut,h));

    wordlist := [];

    for i in [Length(p)..n] do
        Append(wordlist,AcceptedWordsReversed(subaut,i));
    od;

    resaut := SequencesToRatExp(wordlist);

    return MinimalAutomaton(RatExpToAut(resaut));

end);

#############################################################################
##
#F  InbetweenPermAutomaton(perm,perm)
##
##  Returns an automaton accepting all encoded rpermutations between the
##  two parameters.
##
DeclareGlobalFunction(InbetweenPermAutomaton,function(p,q)
local pAut,qAut,k;

k := Maximum(RankEncoding(p));

pAut := AutOfAllSubPerms(p);
qAut := AutOfknSuperPerms(q,k,Length(p));

return MinimalAutomaton(IntersectionAutomaton(pAut,qAut));

end);