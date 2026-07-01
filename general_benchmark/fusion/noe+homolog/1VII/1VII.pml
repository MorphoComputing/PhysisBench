# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.7575066966886834

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 1+4+7+12+27+28+29+30+32+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1VII and resi 15+30+32
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1VII and resi 1 and name CA, 1VII and resi 14 and name CA  # target=5.212492862963047 current=8.132869988618676
color yellow, pair_00
distance pair_01, 1VII and resi 1 and name CA, 1VII and resi 10 and name CA  # target=5.212492862963047 current=8.090309130954019
color yellow, pair_01
distance pair_02, 1VII and resi 6 and name CA, 1VII and resi 17 and name CA  # target=4.893392851656878 current=7.574290790064304
color yellow, pair_02
distance pair_03, 1VII and resi 2 and name CA, 1VII and resi 33 and name CA  # target=16.48249303426945 current=13.834707321277584
color yellow, pair_03
distance pair_04, 1VII and resi 5 and name CA, 1VII and resi 33 and name CA  # target=14.143242875894178 current=11.669982530165093
color yellow, pair_04
distance pair_05, 1VII and resi 6 and name CA, 1VII and resi 33 and name CA  # target=12.855958484270877 current=10.431315815898824
color yellow, pair_05
distance pair_06, 1VII and resi 9 and name CA, 1VII and resi 33 and name CA  # target=10.073250141502866 current=7.691152785568887
color yellow, pair_06
distance pair_07, 1VII and resi 3 and name CA, 1VII and resi 33 and name CA  # target=17.46902241953117 current=15.214603343835886
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
