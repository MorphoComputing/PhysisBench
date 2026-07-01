# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.8860214017854886

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 3+4+5+7+8+9+10+13+14+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HVZ and resi 5
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HVZ and resi 2 and name CA, 1HVZ and resi 16 and name CA  # target=7.253729180065138 current=5.533135006817673
color yellow, pair_00
distance pair_01, 1HVZ and resi 2 and name CA, 1HVZ and resi 15 and name CA  # target=5.528183144622219 current=4.111913811485836
color yellow, pair_01
distance pair_02, 1HVZ and resi 6 and name CA, 1HVZ and resi 15 and name CA  # target=13.994355561615993 current=12.659553864531702
color yellow, pair_02
distance pair_03, 1HVZ and resi 4 and name CA, 1HVZ and resi 16 and name CA  # target=11.886157032994417 current=10.628363816424251
color yellow, pair_03
distance pair_04, 1HVZ and resi 4 and name CA, 1HVZ and resi 13 and name CA  # target=4.865851860848701 current=3.694903427049611
color yellow, pair_04
distance pair_05, 1HVZ and resi 7 and name CA, 1HVZ and resi 16 and name CA  # target=15.656495699866586 current=14.549873263386623
color yellow, pair_05
distance pair_06, 1HVZ and resi 5 and name CA, 1HVZ and resi 13 and name CA  # target=6.980723266362336 current=5.979408559375053
color yellow, pair_06
distance pair_07, 1HVZ and resi 7 and name CA, 1HVZ and resi 15 and name CA  # target=15.82022398905033 current=14.872034348636953
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
