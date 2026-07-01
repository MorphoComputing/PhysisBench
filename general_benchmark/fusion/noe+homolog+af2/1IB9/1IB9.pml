# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.6847466404117672

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 1+2+3+4+5+6+21+23+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1IB9 and resi 4+12+27+30
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1IB9 and resi 1 and name CA, 1IB9 and resi 28 and name CA  # target=25.007125728110037 current=18.382501174213782
color yellow, pair_00
distance pair_01, 1IB9 and resi 1 and name CA, 1IB9 and resi 27 and name CA  # target=21.71347840393706 current=15.711864997042046
color yellow, pair_01
distance pair_02, 1IB9 and resi 1 and name CA, 1IB9 and resi 25 and name CA  # target=16.527179337767656 current=10.943166026432417
color yellow, pair_02
distance pair_03, 1IB9 and resi 1 and name CA, 1IB9 and resi 29 and name CA  # target=25.982929806729942 current=21.306572689133187
color yellow, pair_03
distance pair_04, 1IB9 and resi 1 and name CA, 1IB9 and resi 26 and name CA  # target=18.87391980265194 current=14.750930975978743
color yellow, pair_04
distance pair_05, 1IB9 and resi 1 and name CA, 1IB9 and resi 24 and name CA  # target=14.527033313368303 current=10.706854353219137
color yellow, pair_05
distance pair_06, 1IB9 and resi 5 and name CA, 1IB9 and resi 27 and name CA  # target=17.344381442268244 current=13.785507503041527
color yellow, pair_06
distance pair_07, 1IB9 and resi 1 and name CA, 1IB9 and resi 30 and name CA  # target=23.509347174746463 current=19.96827690194909
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
