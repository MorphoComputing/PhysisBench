# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.708232696188095

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 1+2+3+5+6+21+22+23+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1IB9 and resi 12+15
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1IB9 and resi 1 and name CA, 1IB9 and resi 28 and name CA  # target=25.007125728110037 current=18.794167808923138
color yellow, pair_00
distance pair_01, 1IB9 and resi 1 and name CA, 1IB9 and resi 27 and name CA  # target=21.71347840393706 current=16.090852776150324
color yellow, pair_01
distance pair_02, 1IB9 and resi 1 and name CA, 1IB9 and resi 25 and name CA  # target=16.527179337767656 current=11.17045986850752
color yellow, pair_02
distance pair_03, 1IB9 and resi 1 and name CA, 1IB9 and resi 29 and name CA  # target=25.982929806729942 current=21.818088111532578
color yellow, pair_03
distance pair_04, 1IB9 and resi 1 and name CA, 1IB9 and resi 24 and name CA  # target=14.527033313368303 current=10.654865969249794
color yellow, pair_04
distance pair_05, 1IB9 and resi 1 and name CA, 1IB9 and resi 26 and name CA  # target=18.87391980265194 current=15.278518603566804
color yellow, pair_05
distance pair_06, 1IB9 and resi 5 and name CA, 1IB9 and resi 27 and name CA  # target=17.344381442268244 current=13.769831321152527
color yellow, pair_06
distance pair_07, 1IB9 and resi 5 and name CA, 1IB9 and resi 28 and name CA  # target=20.758250207317335 current=17.359198010229445
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
