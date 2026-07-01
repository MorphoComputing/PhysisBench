# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.2066940661407697

load 1D0R.pdb, 1D0R
bg_color white
hide everything, 1D0R
show cartoon, 1D0R
color grey80, 1D0R
set cartoon_transparency, 0.1

select worst_residues, 1D0R and resi 4+8+9+11+14+17+19+20+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1D0R and resi 7+26
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1D0R and resi 10 and name CA, 1D0R and resi 25 and name CA  # target=22.256322955398645 current=25.34764791998228
color yellow, pair_00
distance pair_01, 1D0R and resi 1 and name CA, 1D0R and resi 23 and name CA  # target=35.91200581810745 current=33.08115683983792
color yellow, pair_01
distance pair_02, 1D0R and resi 1 and name CA, 1D0R and resi 20 and name CA  # target=27.15226395397291 current=29.49498140014444
color yellow, pair_02
distance pair_03, 1D0R and resi 3 and name CA, 1D0R and resi 21 and name CA  # target=24.946902750139195 current=27.22286065459103
color yellow, pair_03
distance pair_04, 1D0R and resi 8 and name CA, 1D0R and resi 18 and name CA  # target=17.5217248918607 current=15.279576226446101
color yellow, pair_04
distance pair_05, 1D0R and resi 6 and name CA, 1D0R and resi 23 and name CA  # target=25.08643672842328 current=27.22560769353907
color yellow, pair_05
distance pair_06, 1D0R and resi 9 and name CA, 1D0R and resi 20 and name CA  # target=20.601634240855116 current=18.554365372265938
color yellow, pair_06
distance pair_07, 1D0R and resi 17 and name CA, 1D0R and resi 26 and name CA  # target=17.690812115531074 current=15.853144968330474
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
