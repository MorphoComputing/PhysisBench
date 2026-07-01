# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.884884593544971

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 1+2+4+5+6+10+11+17+19+22
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1PT4 and resi 4+11+24
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1PT4 and resi 1 and name CA, 1PT4 and resi 12 and name CA  # target=5.790717228239924 current=12.946499720555678
color yellow, pair_00
distance pair_01, 1PT4 and resi 4 and name CA, 1PT4 and resi 23 and name CA  # target=3.401322743271444 current=9.744913941745766
color yellow, pair_01
distance pair_02, 1PT4 and resi 1 and name CA, 1PT4 and resi 15 and name CA  # target=4.893392851656878 current=11.047462178861158
color yellow, pair_02
distance pair_03, 1PT4 and resi 3 and name CA, 1PT4 and resi 11 and name CA  # target=4.893392851656878 current=10.732618602783257
color yellow, pair_03
distance pair_04, 1PT4 and resi 1 and name CA, 1PT4 and resi 10 and name CA  # target=5.212492862963047 current=10.344807178112553
color yellow, pair_04
distance pair_05, 1PT4 and resi 16 and name CA, 1PT4 and resi 25 and name CA  # target=5.533144452470395 current=8.986750539566039
color yellow, pair_05
distance pair_06, 1PT4 and resi 5 and name CA, 1PT4 and resi 17 and name CA  # target=5.7452329065466445 current=9.052939975235946
color yellow, pair_06
distance pair_07, 1PT4 and resi 2 and name CA, 1PT4 and resi 21 and name CA  # target=5.790717228239924 current=8.732403538649427
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
