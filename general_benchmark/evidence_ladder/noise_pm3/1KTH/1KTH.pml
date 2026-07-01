# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.096180964707168

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 12+13+14+15+16+37+38+43+53+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1KTH and resi 14+54+78+638
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1KTH and resi 20 and name CA, 1KTH and resi 43 and name CA  # target=14.030917046259168 current=4.106553817358597
color yellow, pair_00
distance pair_01, 1KTH and resi 14 and name CA, 1KTH and resi 37 and name CA  # target=14.027920681724792 current=4.605327145179615
color yellow, pair_01
distance pair_02, 1KTH and resi 13 and name CA, 1KTH and resi 38 and name CA  # target=14.230553022363345 current=5.424392008388866
color yellow, pair_02
distance pair_03, 1KTH and resi 29 and name CA, 1KTH and resi 41 and name CA  # target=22.141329585795184 current=13.779545048275349
color yellow, pair_03
distance pair_04, 1KTH and resi 8 and name CA, 1KTH and resi 37 and name CA  # target=20.410758794083186 current=12.291253389212176
color yellow, pair_04
distance pair_05, 1KTH and resi 11 and name CA, 1KTH and resi 38 and name CA  # target=10.996950810479344 current=3.098962957452089
color yellow, pair_05
distance pair_06, 1KTH and resi 14 and name CA, 1KTH and resi 39 and name CA  # target=17.221686898448343 current=9.753017818021702
color yellow, pair_06
distance pair_07, 1KTH and resi 16 and name CA, 1KTH and resi 37 and name CA  # target=13.95053263960052 current=6.690963947027484
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
