# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.1664743202506878

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 4+5+6+7+9+10+11+13+22+23
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 19 and name CA, 2KNM and resi 28 and name CA  # target=5.164930796464935 current=4.429592037397598
color yellow, pair_00
distance pair_01, 2KNM and resi 2 and name CA, 2KNM and resi 27 and name CA  # target=5.179161944558609 current=4.517155289692619
color yellow, pair_01
distance pair_02, 2KNM and resi 6 and name CA, 2KNM and resi 25 and name CA  # target=5.284194920491766 current=4.664117095360033
color yellow, pair_02
distance pair_03, 2KNM and resi 7 and name CA, 2KNM and resi 24 and name CA  # target=5.543652130418264 current=5.025940256951711
color yellow, pair_03
distance pair_04, 2KNM and resi 19 and name CA, 2KNM and resi 27 and name CA  # target=5.506351881065375 current=4.996372544919304
color yellow, pair_04
distance pair_05, 2KNM and resi 7 and name CA, 2KNM and resi 25 and name CA  # target=5.977213568030356 current=5.539471812010161
color yellow, pair_05
distance pair_06, 2KNM and resi 2 and name CA, 2KNM and resi 23 and name CA  # target=11.65088730185861 current=11.229346223721572
color yellow, pair_06
distance pair_07, 2KNM and resi 1 and name CA, 2KNM and resi 28 and name CA  # target=5.6710236985294475 current=5.259529456891392
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
