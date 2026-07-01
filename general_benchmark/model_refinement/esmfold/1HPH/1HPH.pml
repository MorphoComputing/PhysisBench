# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.22320548116876

load 1HPH.pdb, 1HPH
bg_color white
hide everything, 1HPH
show cartoon, 1HPH
color grey80, 1HPH
set cartoon_transparency, 0.1

select worst_residues, 1HPH and resi 1+2+6+7+11+12+13+27+34+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HPH and resi 5
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HPH and resi 11 and name CA, 1HPH and resi 30 and name CA  # target=27.067165195410915 current=21.928545332898043
color yellow, pair_00
distance pair_01, 1HPH and resi 11 and name CA, 1HPH and resi 29 and name CA  # target=26.412579175708494 current=21.689197010000008
color yellow, pair_01
distance pair_02, 1HPH and resi 11 and name CA, 1HPH and resi 33 and name CA  # target=27.471828878016147 current=23.525071083806324
color yellow, pair_02
distance pair_03, 1HPH and resi 10 and name CA, 1HPH and resi 29 and name CA  # target=27.034242637913618 current=23.480007568279056
color yellow, pair_03
distance pair_04, 1HPH and resi 10 and name CA, 1HPH and resi 30 and name CA  # target=27.3184358988351 current=23.766580454061366
color yellow, pair_04
distance pair_05, 1HPH and resi 11 and name CA, 1HPH and resi 34 and name CA  # target=27.49010151462076 current=24.08430740976754
color yellow, pair_05
distance pair_06, 1HPH and resi 1 and name CA, 1HPH and resi 27 and name CA  # target=27.499207542041816 current=30.805548527218797
color yellow, pair_06
distance pair_07, 1HPH and resi 11 and name CA, 1HPH and resi 35 and name CA  # target=27.496057611921888 current=24.23142162564007
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
