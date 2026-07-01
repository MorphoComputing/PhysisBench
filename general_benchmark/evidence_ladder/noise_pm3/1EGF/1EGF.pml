# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.283555755781552

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 7+8+9+11+23+24+25+34+35+49
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1EGF and resi 11+32+37+85+128+353
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1EGF and resi 13 and name CA, 1EGF and resi 30 and name CA  # target=13.778961171453377 current=5.444624853140661
color yellow, pair_00
distance pair_01, 1EGF and resi 14 and name CA, 1EGF and resi 51 and name CA  # target=14.633231884007364 current=22.293104865196174
color yellow, pair_01
distance pair_02, 1EGF and resi 15 and name CA, 1EGF and resi 31 and name CA  # target=16.767503562220227 current=9.317686027314886
color yellow, pair_02
distance pair_03, 1EGF and resi 21 and name CA, 1EGF and resi 41 and name CA  # target=7.141512137133234 current=14.461987010520588
color yellow, pair_03
distance pair_04, 1EGF and resi 21 and name CA, 1EGF and resi 38 and name CA  # target=20.56071769441412 current=13.265627477051403
color yellow, pair_04
distance pair_05, 1EGF and resi 8 and name CA, 1EGF and resi 20 and name CA  # target=17.87480661636574 current=10.612041229660742
color yellow, pair_05
distance pair_06, 1EGF and resi 1 and name CA, 1EGF and resi 11 and name CA  # target=24.217687839125503 current=17.073149596856695
color yellow, pair_06
distance pair_07, 1EGF and resi 5 and name CA, 1EGF and resi 32 and name CA  # target=7.7885385610727695 current=14.571618065625918
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
