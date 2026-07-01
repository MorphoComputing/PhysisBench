# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.0184626850207708

load 1ENH.pdb, 1ENH
bg_color white
hide everything, 1ENH
show cartoon, 1ENH
color grey80, 1ENH
set cartoon_transparency, 0.1

select worst_residues, 1ENH and resi 1+7+11+17+29+34+47+48+49+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1ENH and resi 18+47+59+97+259
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1ENH and resi 29 and name CA, 1ENH and resi 49 and name CA  # target=12.021720249043963 current=21.493461525904163
color yellow, pair_00
distance pair_01, 1ENH and resi 1 and name CA, 1ENH and resi 40 and name CA  # target=14.685937588700785 current=5.512407431320359
color yellow, pair_01
distance pair_02, 1ENH and resi 18 and name CA, 1ENH and resi 50 and name CA  # target=17.60903750894806 current=8.668665680654808
color yellow, pair_02
distance pair_03, 1ENH and resi 3 and name CA, 1ENH and resi 42 and name CA  # target=16.01381578076008 current=7.130916764195816
color yellow, pair_03
distance pair_04, 1ENH and resi 11 and name CA, 1ENH and resi 47 and name CA  # target=20.82701415177601 current=12.238391611987355
color yellow, pair_04
distance pair_05, 1ENH and resi 10 and name CA, 1ENH and resi 40 and name CA  # target=21.262022852893736 current=13.0789336005505
color yellow, pair_05
distance pair_06, 1ENH and resi 1 and name CA, 1ENH and resi 43 and name CA  # target=17.10160556662795 current=9.391163080980023
color yellow, pair_06
distance pair_07, 1ENH and resi 15 and name CA, 1ENH and resi 37 and name CA  # target=8.279987026029813 current=15.591553579353826
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
