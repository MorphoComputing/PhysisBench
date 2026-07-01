# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.649683303607756

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 3+4+9+10+11+16+17+21+22+29
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1IB9 and resi 5+28
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1IB9 and resi 2 and name CA, 1IB9 and resi 26 and name CA  # target=4.992446382738918 current=15.36197547663848
color yellow, pair_00
distance pair_01, 1IB9 and resi 1 and name CA, 1IB9 and resi 28 and name CA  # target=5.212492862963047 current=13.80734120712829
color yellow, pair_01
distance pair_02, 1IB9 and resi 17 and name CA, 1IB9 and resi 27 and name CA  # target=4.319607547269556 current=8.464367470237159
color yellow, pair_02
distance pair_03, 1IB9 and resi 15 and name CA, 1IB9 and resi 27 and name CA  # target=4.513593196480815 current=7.7019222128987765
color yellow, pair_03
distance pair_04, 1IB9 and resi 18 and name CA, 1IB9 and resi 27 and name CA  # target=3.8213522711035743 current=5.661810351152547
color yellow, pair_04
distance pair_05, 1IB9 and resi 8 and name CA, 1IB9 and resi 26 and name CA  # target=5.803813747193671 current=7.639486408572643
color yellow, pair_05
distance pair_06, 1IB9 and resi 13 and name CA, 1IB9 and resi 22 and name CA  # target=5.7452329065466445 current=7.404218207947142
color yellow, pair_06
distance pair_07, 1IB9 and resi 14 and name CA, 1IB9 and resi 32 and name CA  # target=3.9791092582064715 current=5.116038946637281
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
