# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.3203002892781621

load 1HPH.pdb, 1HPH
bg_color white
hide everything, 1HPH
show cartoon, 1HPH
color grey80, 1HPH
set cartoon_transparency, 0.1

select worst_residues, 1HPH and resi 1+2+7+9+10+23+31+32+33+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HPH and resi 10+26
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HPH and resi 14 and name CA, 1HPH and resi 26 and name CA  # target=15.973931150933964 current=12.916673610816499
color yellow, pair_00
distance pair_01, 1HPH and resi 1 and name CA, 1HPH and resi 15 and name CA  # target=15.848094613882793 current=18.817744137416554
color yellow, pair_01
distance pair_02, 1HPH and resi 1 and name CA, 1HPH and resi 28 and name CA  # target=27.478584627259035 current=30.248401966064055
color yellow, pair_02
distance pair_03, 1HPH and resi 1 and name CA, 1HPH and resi 10 and name CA  # target=14.145952578823131 current=11.396107082770927
color yellow, pair_03
distance pair_04, 1HPH and resi 14 and name CA, 1HPH and resi 24 and name CA  # target=10.23734678859076 current=12.97374285512422
color yellow, pair_04
distance pair_05, 1HPH and resi 17 and name CA, 1HPH and resi 26 and name CA  # target=16.63031107377692 current=14.039449953405853
color yellow, pair_05
distance pair_06, 1HPH and resi 21 and name CA, 1HPH and resi 35 and name CA  # target=17.815794766183352 current=15.351472532381955
color yellow, pair_06
distance pair_07, 1HPH and resi 9 and name CA, 1HPH and resi 18 and name CA  # target=14.936791684348352 current=12.486953564319405
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
