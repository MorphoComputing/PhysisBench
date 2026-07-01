# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.602907975436933

load 4INS.pdb, 4INS
bg_color white
hide everything, 4INS
show cartoon, 4INS
color grey80, 4INS
set cartoon_transparency, 0.1

select worst_residues, 4INS and resi 45+46+47+51+55+67+68+71+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4INS and resi 47+71+756
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4INS and resi 47 and name CA, 4INS and resi 58 and name CA  # target=26.915572725123205 current=8.99321189536219
color yellow, pair_00
distance pair_01, 4INS and resi 46 and name CA, 4INS and resi 72 and name CA  # target=22.71375705799234 current=4.87684255122301
color yellow, pair_01
distance pair_02, 4INS and resi 46 and name CA, 4INS and resi 54 and name CA  # target=27.485220624119467 current=10.838087912349561
color yellow, pair_02
distance pair_03, 4INS and resi 46 and name CA, 4INS and resi 68 and name CA  # target=27.29455361270812 current=10.743961772654906
color yellow, pair_03
distance pair_04, 4INS and resi 47 and name CA, 4INS and resi 56 and name CA  # target=27.499634072146932 current=11.25983309953776
color yellow, pair_04
distance pair_05, 4INS and resi 45 and name CA, 4INS and resi 73 and name CA  # target=19.358015401148517 current=3.2612609985767165
color yellow, pair_05
distance pair_06, 4INS and resi 47 and name CA, 4INS and resi 57 and name CA  # target=27.444222096204147 current=11.663572662657632
color yellow, pair_06
distance pair_07, 4INS and resi 47 and name CA, 4INS and resi 55 and name CA  # target=27.49998216429898 current=11.742108790905876
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
