# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.6338111645773488

load 1TEN.pdb, 1TEN
bg_color white
hide everything, 1TEN
show cartoon, 1TEN
color grey80, 1TEN
set cartoon_transparency, 0.1

select worst_residues, 1TEN and resi 13+37+39+41+57+60+61+62+64+66
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TEN and resi 9+62
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TEN and resi 13 and name CA, 1TEN and resi 76 and name CA  # target=27.49999992724799 current=34.955481243793926
color yellow, pair_00
distance pair_01, 1TEN and resi 14 and name CA, 1TEN and resi 77 and name CA  # target=27.49999999763107 current=34.71248207519933
color yellow, pair_01
distance pair_02, 1TEN and resi 37 and name CA, 1TEN and resi 60 and name CA  # target=12.200330588626308 current=6.089668951304315
color yellow, pair_02
distance pair_03, 1TEN and resi 39 and name CA, 1TEN and resi 61 and name CA  # target=14.46722809831348 current=8.692445822889468
color yellow, pair_03
distance pair_04, 1TEN and resi 57 and name CA, 1TEN and resi 70 and name CA  # target=14.334573797653958 current=8.865584508781208
color yellow, pair_04
distance pair_05, 1TEN and resi 14 and name CA, 1TEN and resi 28 and name CA  # target=27.49999574715219 current=32.82535807180238
color yellow, pair_05
distance pair_06, 1TEN and resi 40 and name CA, 1TEN and resi 62 and name CA  # target=12.68113599314212 current=7.397597222452262
color yellow, pair_06
distance pair_07, 1TEN and resi 41 and name CA, 1TEN and resi 60 and name CA  # target=18.572566927245596 current=13.35884273311171
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
